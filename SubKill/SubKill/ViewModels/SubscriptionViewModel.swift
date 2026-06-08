import Foundation
import SwiftData
import Observation

@Observable
class SubscriptionViewModel {
    var modelContext: ModelContext
    var searchText = ""
    var templates: [SubscriptionTemplate] = []

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        loadTemplates()
    }

    var filteredTemplates: [SubscriptionTemplate] {
        guard !searchText.isEmpty else { return Array(templates.prefix(20)) }
        return templates.filter { template in
            template.name.localizedCaseInsensitiveContains(searchText) ||
            template.searchTerms.contains { $0.localizedCaseInsensitiveContains(searchText) } ||
            template.category.localizedCaseInsensitiveContains(searchText)
        }
    }

    var canAddSubscription: Bool {
        let activeCount = fetchActive().count
        return StoreManager.shared.isPro || activeCount < 5
    }

    func addSubscription(from template: SubscriptionTemplate, nextPaymentDate: Date = Date().addingTimeInterval(86400 * 30)) {
        guard canAddSubscription else { return }
        let sub = Subscription(
            name: template.name,
            price: template.defaultPrice,
            billingCycle: template.billingCycle,
            nextPaymentDate: nextPaymentDate,
            category: template.category,
            cancelURL: template.cancelURL,
            iconName: template.iconName
        )
        modelContext.insert(sub)
        try? modelContext.save()
        NotificationManager.shared.scheduleAllReminders(for: sub)
    }

    func addSubscription(name: String, price: Double, currency: String, billingCycle: BillingCycle, nextPaymentDate: Date, category: String, isTrial: Bool = false, trialEndDate: Date? = nil, cancelURL: String? = nil, notes: String? = nil, iconName: String = "app.fill") -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, price > 0, nextPaymentDate >= Calendar.current.startOfDay(for: Date()) else {
            return false
        }
        guard canAddSubscription else { return false }
        let sub = Subscription(
            name: name,
            price: price,
            currency: currency,
            billingCycle: billingCycle,
            nextPaymentDate: nextPaymentDate,
            category: category,
            isTrial: isTrial,
            trialEndDate: trialEndDate,
            cancelURL: cancelURL,
            notes: notes,
            iconName: iconName
        )
        modelContext.insert(sub)
        try? modelContext.save()
        NotificationManager.shared.scheduleAllReminders(for: sub)
        return true
    }

    func deleteSubscription(_ subscription: Subscription) {
        modelContext.delete(subscription)
        try? modelContext.save()
    }

    func cancelSubscription(_ subscription: Subscription) {
        subscription.cancel()
        try? modelContext.save()
    }

    func pauseSubscription(_ subscription: Subscription) {
        subscription.pause()
        try? modelContext.save()
    }

    func resumeSubscription(_ subscription: Subscription) {
        subscription.resume()
        try? modelContext.save()
    }

    func updatePrice(_ subscription: Subscription, newPrice: Double) {
        if let change = subscription.updatePrice(newPrice) {
            modelContext.insert(change)
        }
        try? modelContext.save()
    }

    func fetchAll() -> [Subscription] {
        let descriptor = FetchDescriptor<Subscription>(sortBy: [SortDescriptor(\.nextPaymentDate)])
        return (try? modelContext.fetch(descriptor)) ?? []
    }

    func fetchActive() -> [Subscription] {
        let all = fetchAll()
        return all.filter { $0.status == .active || $0.status == .trial }
    }

    func fetchUpcoming(days: Int = 7) -> [Subscription] {
        let cutoff = Calendar.current.date(byAdding: .day, value: days, to: Date()) ?? Date()
        let active = fetchActive()
        return active.filter { $0.nextPaymentDate <= cutoff && $0.nextPaymentDate >= Date() }
    }

    func fetchTrialExpiring(days: Int = 3) -> [Subscription] {
        let cutoff = Calendar.current.date(byAdding: .day, value: days, to: Date()) ?? Date()
        let active = fetchActive()
        return active.filter { $0.isTrial && ($0.trialEndDate ?? .distantFuture) <= cutoff }
    }

    func checkTrialConversions() {
        let active = fetchActive()
        for sub in active where sub.isTrial {
            if let trialEnd = sub.trialEndDate, trialEnd <= Date() {
                sub.convertTrialToActive()
            }
        }
        try? modelContext.save()
    }

    private func loadTemplates() {
        guard let url = Bundle.main.url(forResource: "SubscriptionTemplates", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { return }
        templates = (try? JSONDecoder().decode([SubscriptionTemplate].self, from: data)) ?? []
    }
}
