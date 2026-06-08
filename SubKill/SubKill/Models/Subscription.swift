import Foundation
import SwiftData

@Model
final class Subscription {
    var name: String
    var price: Double
    var currency: String
    var billingCycle: BillingCycle
    var nextPaymentDate: Date
    var category: String
    var status: SubscriptionStatus
    var isTrial: Bool
    var trialEndDate: Date?
    var cancelURL: String?
    var notes: String?
    var iconName: String
    var createdAt: Date
    var updatedAt: Date

    @Relationship(deleteRule: .cascade, inverse: \PriceChange.subscription)
    var priceChanges: [PriceChange] = []

    var monthlyPrice: Double {
        price * billingCycle.monthsPerCycle / 1.0
    }

    var yearlyPrice: Double {
        monthlyPrice * 12
    }

    var daysUntilNextPayment: Int {
        Calendar.current.dateComponents([.day], from: Date(), to: nextPaymentDate).day ?? 0
    }

    var daysUntilTrialEnd: Int? {
        guard isTrial, let trialEnd = trialEndDate else { return nil }
        return Calendar.current.dateComponents([.day], from: Date(), to: trialEnd).day
    }

    init(name: String, price: Double, currency: String = "USD", billingCycle: BillingCycle = .monthly, nextPaymentDate: Date, category: String = "Other", status: SubscriptionStatus = .active, isTrial: Bool = false, trialEndDate: Date? = nil, cancelURL: String? = nil, notes: String? = nil, iconName: String = "app.fill") {
        self.name = name
        self.price = price
        self.currency = currency
        self.billingCycle = billingCycle
        self.nextPaymentDate = nextPaymentDate
        self.category = category
        self.status = status
        self.isTrial = isTrial
        self.trialEndDate = trialEndDate
        self.cancelURL = cancelURL
        self.notes = notes
        self.iconName = iconName
        self.createdAt = Date()
        self.updatedAt = Date()
    }

    func cancel() {
        status = .cancelled
        updatedAt = Date()
    }

    func pause() {
        status = .paused
        updatedAt = Date()
    }

    func resume() {
        status = .active
        updatedAt = Date()
    }

    func updatePrice(_ newPrice: Double) -> PriceChange? {
        guard newPrice != price else { return nil }
        let change = PriceChange(oldPrice: price, newPrice: newPrice, subscription: self)
        price = newPrice
        updatedAt = Date()
        return change
    }

    func convertTrialToActive() {
        guard isTrial else { return }
        isTrial = false
        trialEndDate = nil
        status = .active
        updatedAt = Date()
    }
}
