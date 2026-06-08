import Foundation
import SwiftData

enum SubscriptionStatus: String, Codable, CaseIterable {
    case active = "active"
    case trial = "trial"
    case paused = "paused"
    case cancelled = "cancelled"
    case expired = "expired"

    var displayName: String {
        switch self {
        case .active: "Active"
        case .trial: "Trial"
        case .paused: "Paused"
        case .cancelled: "Cancelled"
        case .expired: "Expired"
        }
    }

    var color: String {
        switch self {
        case .active: "34C759"
        case .trial: "FF9500"
        case .paused: "8E8E93"
        case .cancelled: "FF3B30"
        case .expired: "636366"
        }
    }
}
