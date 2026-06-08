import Foundation
import UserNotifications

@Observable
class NotificationManager {
    static let shared = NotificationManager()

    var isAuthorized = false

    func requestAuthorization() async -> Bool {
        do {
            let center = UNUserNotificationCenter.current()
            isAuthorized = try await center.requestAuthorization(options: [.alert, .badge, .sound])
            return isAuthorized
        } catch {
            return false
        }
    }

    func scheduleChargeReminder(for subscription: Subscription, daysBefore: Int = 1) {
        guard let triggerDate = Calendar.current.date(byAdding: .day, value: -daysBefore, to: subscription.nextPaymentDate) else { return }
        guard triggerDate > Date() else { return }

        let content = UNMutableNotificationContent()
        content.title = "Upcoming Charge"
        content.body = "\(subscription.name) will charge \(subscription.currency)\(String(format: "%.2f", subscription.price)) tomorrow"
        content.sound = .default
        content.categoryIdentifier = "CHARGE_REMINDER"
        content.userInfo = ["subscriptionName": subscription.name]

        let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: triggerDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

        let request = UNNotificationRequest(
            identifier: "charge_\(subscription.name)_\(subscription.nextPaymentDate.timeIntervalSince1970)",
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }

    func scheduleTrialExpiryReminder(for subscription: Subscription) {
        guard subscription.isTrial, let trialEnd = subscription.trialEndDate else { return }

        for daysBefore in [3, 1] {
            guard let triggerDate = Calendar.current.date(byAdding: .day, value: -daysBefore, to: trialEnd) else { continue }
            guard triggerDate > Date() else { continue }

            let content = UNMutableNotificationContent()
            content.title = "Trial Expiring"
            content.body = "\(subscription.name) trial ends in \(daysBefore) day(s). Cancel before you're charged!"
            content.sound = .default
            content.categoryIdentifier = "TRIAL_EXPIRY"
            content.userInfo = ["subscriptionName": subscription.name]

            let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: triggerDate)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

            let request = UNNotificationRequest(
                identifier: "trial_\(subscription.name)_\(daysBefore)d",
                content: content,
                trigger: trigger
            )

            UNUserNotificationCenter.current().add(request)
        }
    }

    func schedulePriceIncreaseAlert(for subscription: Subscription, oldPrice: Double, newPrice: Double) {
        let content = UNMutableNotificationContent()
        content.title = "Price Increase Alert"
        content.body = "\(subscription.name) raised from \(String(format: "%.2f", oldPrice)) to \(String(format: "%.2f", newPrice))"
        content.sound = .default
        content.categoryIdentifier = "PRICE_CHANGE"
        content.userInfo = ["subscriptionName": subscription.name]

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(
            identifier: "price_\(subscription.name)_\(Date().timeIntervalSince1970)",
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }

    func cancelNotifications(for subscriptionName: String) {
        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests { requests in
            let ids = requests.filter { $0.identifier.contains(subscriptionName) }.map(\.identifier)
            center.removePendingNotificationRequests(withIdentifiers: ids)
        }
    }

    func scheduleAllReminders(for subscription: Subscription, reminderDays: [Int] = [1]) {
        for days in reminderDays {
            scheduleChargeReminder(for: subscription, daysBefore: days)
        }
        if subscription.isTrial {
            scheduleTrialExpiryReminder(for: subscription)
        }
    }

    func registerNotificationCategories() {
        let killAction = UNNotificationAction(identifier: "KILL_IT", title: "Kill It", options: [.foreground])
        let keepAction = UNNotificationAction(identifier: "KEEP_IT", title: "Keep It", options: [])
        let chargeCategory = UNNotificationCategory(identifier: "CHARGE_REMINDER", actions: [killAction, keepAction], intentIdentifiers: [])

        let cancelNowAction = UNNotificationAction(identifier: "CANCEL_NOW", title: "Cancel Now", options: [.foreground])
        let remindAction = UNNotificationAction(identifier: "REMIND_TOMORROW", title: "Remind Tomorrow", options: [])
        let trialCategory = UNNotificationCategory(identifier: "TRIAL_EXPIRY", actions: [cancelNowAction, remindAction], intentIdentifiers: [])

        let viewAction = UNNotificationAction(identifier: "VIEW", title: "View", options: [.foreground])
        let cancelSubAction = UNNotificationAction(identifier: "CANCEL_SUB", title: "Cancel Sub", options: [.foreground])
        let priceCategory = UNNotificationCategory(identifier: "PRICE_CHANGE", actions: [viewAction, cancelSubAction], intentIdentifiers: [])

        UNUserNotificationCenter.current().setNotificationCategories([chargeCategory, trialCategory, priceCategory])
    }
}
