import SwiftUI

struct ProPaywallView: View {
    let storeManager: StoreManager
    @Environment(\.dismiss) private var dismiss

    private let features: [(String, String, Bool)] = [
        ("Unlimited Subscriptions", "square.stack.3d.up", false),
        ("Calendar View", "calendar", false),
        ("Price Change Tracking", "chart.line.uptrend.xyaxis", false),
        ("Trial Countdown", "hourglass", false),
        ("Savings Report", "dollarsign.circle", false),
        ("Home Screen Widget", "platter.filled.bottom.iphone", false),
        ("Custom Categories", "folder.fill", false),
        ("CSV Data Export", "square.and.arrow.up", false),
        ("Biometric Lock", "faceid", false),
        ("iCloud Sync", "cloud", false)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    Image(systemName: "crown.fill")
                        .font(.system(size: 56))
                        .foregroundStyle(.yellow)
                        .padding(.top, 20)

                    Text("SubKill Pro")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)

                    Text("One-time purchase. No subscription irony.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(features, id: \.0) { feature, icon, _ in
                            HStack(spacing: 10) {
                                Image(systemName: icon)
                                    .foregroundStyle(.green)
                                    .frame(width: 20)
                                Text(feature)
                                    .font(.subheadline)
                                    .foregroundStyle(.white)
                                Spacer()
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.green)
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6).opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                    VStack(spacing: 12) {
                        Button(action: purchase) {
                            HStack {
                                if storeManager.isLoading {
                                    ProgressView()
                                        .tint(.white)
                                }
                                Text("Unlock Pro — \(storeManager.displayPrice)")
                                    .font(.headline)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                        .disabled(storeManager.isLoading)

                        Button("Restore Purchases") {
                            Task { await storeManager.restorePurchases() }
                        }
                        .font(.caption)
                        .foregroundStyle(.secondary)

                        HStack(spacing: 16) {
                            Link("Privacy Policy", destination: URL(string: "https://asunnyboy861.github.io/SubKill/privacy.html")!)
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                            Link("Terms of Use", destination: URL(string: "https://asunnyboy861.github.io/SubKill/terms.html")!)
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .padding()
            }
            .background(Color.black)
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }

    private func purchase() {
        Task {
            if await storeManager.purchase() {
                dismiss()
            }
        }
    }
}
