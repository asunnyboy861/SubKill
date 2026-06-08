import Foundation
import SwiftData

@Model
final class PriceChange {
    var oldPrice: Double
    var newPrice: Double
    var changedAt: Date

    var subscription: Subscription?

    var priceDifference: Double {
        newPrice - oldPrice
    }

    var isIncrease: Bool {
        newPrice > oldPrice
    }

    var percentageChange: Double {
        guard oldPrice > 0 else { return 0 }
        return ((newPrice - oldPrice) / oldPrice) * 100
    }

    init(oldPrice: Double, newPrice: Double, subscription: Subscription? = nil) {
        self.oldPrice = oldPrice
        self.newPrice = newPrice
        self.changedAt = Date()
        self.subscription = subscription
    }
}
