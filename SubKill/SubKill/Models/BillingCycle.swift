import Foundation

enum BillingCycle: String, Codable, CaseIterable {
    case weekly = "weekly"
    case monthly = "monthly"
    case quarterly = "quarterly"
    case yearly = "yearly"

    var displayName: String {
        switch self {
        case .weekly: "Weekly"
        case .monthly: "Monthly"
        case .quarterly: "Quarterly"
        case .yearly: "Yearly"
        }
    }

    var monthsPerCycle: Double {
        switch self {
        case .weekly: 1.0 / 4.33
        case .monthly: 1.0
        case .quarterly: 3.0
        case .yearly: 12.0
        }
    }

    func nextDate(from date: Date) -> Date {
        switch self {
        case .weekly:
            Calendar.current.date(byAdding: .day, value: 7, to: date) ?? date
        case .monthly:
            Calendar.current.date(byAdding: .month, value: 1, to: date) ?? date
        case .quarterly:
            Calendar.current.date(byAdding: .month, value: 3, to: date) ?? date
        case .yearly:
            Calendar.current.date(byAdding: .year, value: 1, to: date) ?? date
        }
    }
}
