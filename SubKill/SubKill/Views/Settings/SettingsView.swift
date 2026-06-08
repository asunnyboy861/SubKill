import SwiftUI

struct SettingsView: View {
    let subscriptionVM: SubscriptionViewModel
    @State private var settingsVM = SettingsViewModel()
    @State private var storeManager = StoreManager.shared
    @State private var showPaywall = false
    @State private var showContact = false
    @State private var csvURL: URL?
    @State private var showShareSheet = false

    private let githubUser = "asunnyboy861"

    var body: some View {
        NavigationStack {
            List {
                proSection
                notificationsSection
                preferencesSection
                dataSection
                aboutSection
            }
            .scrollContentBackground(.hidden)
            .background(Color.black)
            .navigationTitle("Settings")
        }
    }

    private var proSection: some View {
        Section {
            if storeManager.isPro {
                HStack {
                    Image(systemName: "crown.fill")
                        .foregroundStyle(.yellow)
                    Text("SubKill Pro")
                        .foregroundStyle(.white)
                    Spacer()
                    Text("Active")
                        .font(.caption.bold())
                        .foregroundStyle(.green)
                }
            } else {
                Button(action: { showPaywall = true }) {
                    HStack {
                        Image(systemName: "crown")
                            .foregroundStyle(.yellow)
                        Text("Unlock Pro")
                            .foregroundStyle(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.secondary)
                    }
                }
            }
        } header: {
            Text("Pro")
        }
        .sheet(isPresented: $showPaywall) {
            ProPaywallView(storeManager: storeManager)
        }
    }

    private var notificationsSection: some View {
        Section {
            Picker("Reminder Days Before", selection: $settingsVM.reminderDays) {
                Text("1 day").tag(1)
                Text("3 days").tag(3)
                Text("7 days").tag(7)
            }
            .onChange(of: settingsVM.reminderDays) { _, new in settingsVM.saveReminderDays(new) }
        } header: {
            Text("Notifications")
        }
    }

    private var preferencesSection: some View {
        Section {
            if settingsVM.isBiometricAvailable {
                Toggle("Biometric Lock", isOn: $settingsVM.biometricLockEnabled)
                    .onChange(of: settingsVM.biometricLockEnabled) { _, new in settingsVM.saveBiometricLock(new) }
            }

            Toggle("iCloud Sync", isOn: $settingsVM.iCloudSyncEnabled)
                .onChange(of: settingsVM.iCloudSyncEnabled) { _, new in settingsVM.saveiCloudSync(new) }

            Picker("Currency", selection: $settingsVM.currency) {
                Text("USD ($)").tag("USD")
                Text("EUR (\u{20ac})").tag("EUR")
                Text("GBP (\u{00a3})").tag("GBP")
                Text("JPY (\u{00a5})").tag("JPY")
                Text("CNY (\u{00a5})").tag("CNY")
            }
            .onChange(of: settingsVM.currency) { _, new in settingsVM.saveCurrency(new) }
        } header: {
            Text("Preferences")
        }
    }

    private var dataSection: some View {
        Section {
            Button(action: exportData) {
                HStack {
                    Label("Export CSV", systemImage: "square.and.arrow.up")
                    Spacer()
                    if showShareSheet {
                        ProgressView()
                    }
                }
            }
            .foregroundStyle(.white)

            Button(action: { showContact = true }) {
                Label("Contact Support", systemImage: "envelope")
            }
            .foregroundStyle(.white)

            if !storeManager.isPro {
                Button(action: { Task { await storeManager.restorePurchases() } }) {
                    Label("Restore Purchases", systemImage: "arrow.uturn.backward")
                }
                .foregroundStyle(.white)
            }
        } header: {
            Text("Data & Support")
        }
        .sheet(isPresented: $showContact) {
            ContactSupportView()
        }
        .sheet(isPresented: $showShareSheet) {
            if let url = csvURL {
                ShareSheet(activityItems: [url])
            }
        }
    }

    private var aboutSection: some View {
        Section {
            Link("Privacy Policy", destination: URL(string: "https://\(githubUser).github.io/SubKill/privacy.html")!)
            Link("Terms of Use", destination: URL(string: "https://\(githubUser).github.io/SubKill/terms.html")!)
            Link("Support Page", destination: URL(string: "https://\(githubUser).github.io/SubKill/support.html")!)

            HStack {
                Text("Version")
                Spacer()
                Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0")
                    .foregroundStyle(.secondary)
            }
        } header: {
            Text("About")
        }
    }

    private func exportData() {
        let subs = subscriptionVM.fetchAll()
        if let url = settingsVM.exportCSV(subscriptions: subs) {
            csvURL = url
            showShareSheet = true
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
