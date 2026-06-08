import Foundation
import SwiftData
import Observation

@Observable
class StatsViewModel {
    var monthlyTotal: Double = 0
    var yearlyTotal: Double = 0
    var totalSaved: Double = 0
    var categoryBreakdown: [String: Double] = [:]
    var spendingTrend: [MonthlySpending] = []
    var recentPriceChanges: [PriceChange] = []
    var cancelledSubscriptions: [Subscription] = []

    func load(subscriptionVM: SubscriptionViewModel) {
        let active = subscriptionVM.fetchActive()
        let all = subscriptionVM.fetchAll()

        monthlyTotal = active.reduce(0) { $0 + $1.monthlyPrice }
        yearlyTotal = monthlyTotal * 12

        categoryBreakdown = [:]
        for sub in active {
            categoryBreakdown[sub.category, default: 0] += sub.monthlyPrice
        }

        cancelledSubscriptions = all.filter { $0.status == .cancelled }
        totalSaved = cancelledSubscriptions.reduce(0.0) { total, sub in
            let months = max(1, Calendar.current.dateComponents([.month], from: sub.updatedAt, to: Date()).month ?? 1)
            return total + (sub.monthlyPrice * Double(months))
        }

        spendingTrend = computeSpendingTrend(all: all)

        let priceChangesDesc = FetchDescriptor<PriceChange>(sortBy: [SortDescriptor(\.changedAt, order: .reverse)])
        recentPriceChanges = (try? subscriptionVM.modelContext.fetch(priceChangesDesc)) ?? []
    }

    private func computeSpendingTrend(all: [Subscription]) -> [MonthlySpending] {
        let calendar = Calendar.current
        let now = Date()
        var trend: [MonthlySpending] = []

        for i in (0..<6).reversed() {
            guard let monthStart = calendar.date(byAdding: .month, value: -i, to: now) else { continue }
            let components = calendar.dateComponents([.year, .month], from: monthStart)
            guard let range = calendar.dateInterval(of: .month, for: calendar.date(from: components) ?? now) else { continue }

            let activeInMonth = all.filter { sub in
                sub.status == .active && sub.createdAt <= range.end
            }
            let total = activeInMonth.reduce(0.0) { $0 + $1.monthlyPrice }

            trend.append(MonthlySpending(
                month: calendar.date(from: components) ?? now,
                total: total
            ))
        }
        return trend
    }
}

struct MonthlySpending: Identifiable {
    let id = UUID()
    let month: Date
    let total: Double
}
