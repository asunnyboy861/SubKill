import Foundation

struct CostReport {
    var monthlyTotal: Double
    var yearlyTotal: Double
    var activeCount: Int
    var trialCount: Int
    var cancelledCount: Int
    var categoryBreakdown: [String: Double]
    var upcomingCharges: [Subscription]
    var trialExpiring: [Subscription]
    var totalSaved: Double
    var priceChanges: [PriceChange]

    static var empty: CostReport {
        CostReport(
            monthlyTotal: 0,
            yearlyTotal: 0,
            activeCount: 0,
            trialCount: 0,
            cancelledCount: 0,
            categoryBreakdown: [:],
            upcomingCharges: [],
            trialExpiring: [],
            totalSaved: 0,
            priceChanges: []
        )
    }
}

struct SubscriptionTemplate: Codable, Identifiable {
    var id: String { name }
    let name: String
    let category: String
    let defaultPrice: Double
    let billingCycle: BillingCycle
    let iconName: String
    let cancelURL: String?
    let searchTerms: [String]
}
