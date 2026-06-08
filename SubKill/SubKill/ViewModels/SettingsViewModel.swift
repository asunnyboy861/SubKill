import Foundation
import Observation
import LocalAuthentication

@Observable
class SettingsViewModel {
    var isPro = false
    var currency = "USD"
    var reminderDays = 1
    var biometricLockEnabled = false
    var iCloudSyncEnabled = false
    var isBiometricAvailable = false
    var isUnlocked = true

    init() {
        checkBiometricAvailability()
        loadSettings()
    }

    func checkBiometricAvailability() {
        let context = LAContext()
        var error: NSError?
        isBiometricAvailable = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
    }

    func authenticateBiometric() async -> Bool {
        let context = LAContext()
        do {
            let result = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Unlock SubKill")
            isUnlocked = result
            return result
        } catch {
            return false
        }
    }

    func exportCSV(subscriptions: [Subscription]) -> URL? {
        let header = "Name,Price,Currency,Billing Cycle,Next Payment,Category,Status,Is Trial,Trial End Date,Cancel URL,Notes\n"
        let rows = subscriptions.map { sub in
            let cycle = sub.billingCycle.rawValue
            let status = sub.status.rawValue
            let trialEnd = sub.trialEndDate.map { ISO8601DateFormatter().string(from: $0) } ?? ""
            let cancelURL = sub.cancelURL ?? ""
            let notes = (sub.notes ?? "").replacingOccurrences(of: ",", with: ";")
            return "\(sub.name),\(sub.price),\(sub.currency),\(cycle),\(ISO8601DateFormatter().string(from: sub.nextPaymentDate)),\(sub.category),\(status),\(sub.isTrial),\(trialEnd),\(cancelURL),\(notes)"
        }
        let csv = header + rows.joined(separator: "\n")

        let tempDir = FileManager.default.temporaryDirectory
        let url = tempDir.appendingPathComponent("SubKill_Export_\(Int(Date().timeIntervalSince1970)).csv")
        do {
            try csv.write(to: url, atomically: true, encoding: .utf8)
            return url
        } catch {
            return nil
        }
    }

    private func loadSettings() {
        currency = UserDefaults.standard.string(forKey: "currency") ?? "USD"
        reminderDays = UserDefaults.standard.integer(forKey: "reminderDays")
        if reminderDays == 0 { reminderDays = 1 }
        biometricLockEnabled = UserDefaults.standard.bool(forKey: "biometricLockEnabled")
        iCloudSyncEnabled = UserDefaults.standard.bool(forKey: "iCloudSyncEnabled")
    }

    func saveCurrency(_ value: String) {
        currency = value
        UserDefaults.standard.set(value, forKey: "currency")
    }

    func saveReminderDays(_ value: Int) {
        reminderDays = value
        UserDefaults.standard.set(value, forKey: "reminderDays")
    }

    func saveBiometricLock(_ enabled: Bool) {
        biometricLockEnabled = enabled
        UserDefaults.standard.set(enabled, forKey: "biometricLockEnabled")
    }

    func saveiCloudSync(_ enabled: Bool) {
        iCloudSyncEnabled = enabled
        UserDefaults.standard.set(enabled, forKey: "iCloudSyncEnabled")
    }
}
