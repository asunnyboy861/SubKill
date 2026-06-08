import Foundation
import SwiftData
import Observation

@Observable
class DashboardViewModel {
    var costReport: CostReport = .empty

    func load(subscriptionVM: SubscriptionViewModel) {
        let active = subscriptionVM.fetchActive()
        let all = subscriptionVM.fetchAll()
        let upcoming = subscriptionVM.fetchUpcoming()
        let trialExpiring = subscriptionVM.fetchTrialExpiring()

        let monthlyTotal = active.reduce(0) { $0 + $1.monthlyPrice }
        let yearlyTotal = monthlyTotal * 12
        let activeCount = active.filter { $0.status == .active }.count
        let trialCount = active.filter { $0.isTrial }.count
        let cancelledCount = all.filter { $0.status == .cancelled }.count

        var categoryBreakdown: [String: Double] = [:]
        for sub in active {
            categoryBreakdown[sub.category, default: 0] += sub.monthlyPrice
        }

        let cancelled = all.filter { $0.status == .cancelled }
        let totalSaved = cancelled.reduce(0.0) { total, sub in
            let months = max(1, Calendar.current.dateComponents([.month], from: sub.updatedAt, to: Date()).month ?? 1)
            return total + (sub.monthlyPrice * Double(months))
        }

        let priceChangesDesc = FetchDescriptor<PriceChange>(sortBy: [SortDescriptor(\.changedAt, order: .reverse)])
        let priceChanges = (try? subscriptionVM.modelContext.fetch(priceChangesDesc)) ?? []

        costReport = CostReport(
            monthlyTotal: monthlyTotal,
            yearlyTotal: yearlyTotal,
            activeCount: activeCount,
            trialCount: trialCount,
            cancelledCount: cancelledCount,
            categoryBreakdown: categoryBreakdown,
            upcomingCharges: upcoming,
            trialExpiring: trialExpiring,
            totalSaved: totalSaved,
            priceChanges: Array(priceChanges.prefix(10))
        )
    }
}
