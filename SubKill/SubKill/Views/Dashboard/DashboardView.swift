import SwiftUI

struct DashboardView: View {
    let subscriptionVM: SubscriptionViewModel
    @State private var dashboardVM = DashboardViewModel()
    @State private var showAddSheet = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    MonthlyTotalCard(monthly: dashboardVM.costReport.monthlyTotal, yearly: dashboardVM.costReport.yearlyTotal, activeCount: dashboardVM.costReport.activeCount)

                    if !dashboardVM.costReport.upcomingCharges.isEmpty {
                        UpcomingChargeCard(charges: dashboardVM.costReport.upcomingCharges)
                    }

                    if !dashboardVM.costReport.trialExpiring.isEmpty {
                        TrialExpiringCard(trials: dashboardVM.costReport.trialExpiring)
                    }

                    ActiveSubscriptionsList(subscriptions: subscriptionVM.fetchActive(), subscriptionVM: subscriptionVM)
                }
                .padding()
            }
            .background(Color.black)
            .navigationTitle("SubKill")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { showAddSheet = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddSubscriptionView(subscriptionVM: subscriptionVM)
            }
            .onAppear {
                subscriptionVM.checkTrialConversions()
                dashboardVM.load(subscriptionVM: subscriptionVM)
            }
            .refreshable {
                subscriptionVM.checkTrialConversions()
                dashboardVM.load(subscriptionVM: subscriptionVM)
            }
        }
    }
}

struct MonthlyTotalCard: View {
    let monthly: Double
    let yearly: Double
    let activeCount: Int

    var body: some View {
        VStack(spacing: 12) {
            Text("Monthly Total")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))

            Text("$\(String(format: "%.2f", monthly))")
                .font(.system(size: 48, weight: .bold, design: .rounded))
                .foregroundStyle(.white)

            HStack(spacing: 24) {
                Label("\(activeCount) Active", systemImage: "circle.fill")
                    .font(.caption)
                    .foregroundStyle(.green)
                Label("$\(String(format: "%.0f", yearly))/yr", systemImage: "calendar")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.7))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .background(
            LinearGradient(colors: [Color.red.opacity(0.8), Color.red.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct UpcomingChargeCard: View {
    let charges: [Subscription]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Upcoming Charges", systemImage: "exclamationmark.triangle")
                .font(.headline)
                .foregroundStyle(.red)

            ForEach(charges, id: \.name) { sub in
                HStack {
                    Image(systemName: sub.iconName)
                        .foregroundStyle(.white)
                    Text(sub.name)
                        .foregroundStyle(.white)
                    Spacer()
                    Text("$\(String(format: "%.2f", sub.price))")
                        .font(.caption.bold())
                        .foregroundStyle(.red)
                    Text("\(sub.daysUntilNextPayment)d")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6).opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct TrialExpiringCard: View {
    let trials: [Subscription]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Trials Expiring Soon", systemImage: "clock.badge.exclamationmark")
                .font(.headline)
                .foregroundStyle(.orange)

            ForEach(trials, id: \.name) { sub in
                HStack {
                    Image(systemName: sub.iconName)
                        .foregroundStyle(.white)
                    Text(sub.name)
                        .foregroundStyle(.white)
                    Spacer()
                    if let days = sub.daysUntilTrialEnd {
                        Text("\(days)d left")
                            .font(.caption.bold())
                            .foregroundStyle(.orange)
                    }
                }
            }
        }
        .padding()
        .background(Color.orange.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.orange.opacity(0.3), lineWidth: 1))
    }
}

struct ActiveSubscriptionsList: View {
    let subscriptions: [Subscription]
    let subscriptionVM: SubscriptionViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Active Subscriptions")
                .font(.headline)
                .foregroundStyle(.white)

            if subscriptions.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "tray")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                    Text("No subscriptions yet")
                        .foregroundStyle(.secondary)
                    Text("Tap + to add your first subscription")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 32)
            } else {
                ForEach(subscriptions, id: \.name) { sub in
                    NavigationLink(destination: SubscriptionDetailView(subscription: sub, subscriptionVM: subscriptionVM)) {
                        SubscriptionRow(subscription: sub)
                    }
                    .swipeActions(edge: .leading) {
                        NavigationLink(destination: SubscriptionDetailView(subscription: sub, subscriptionVM: subscriptionVM)) {
                            Label("Details", systemImage: "info.circle")
                        }
                        .tint(.blue)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            subscriptionVM.cancelSubscription(sub)
                            NotificationManager.shared.cancelNotifications(for: sub.name)
                        } label: {
                            Label("Kill", systemImage: "target")
                        }
                        .tint(.red)

                        Button {
                            subscriptionVM.pauseSubscription(sub)
                        } label: {
                            Label("Pause", systemImage: "pause")
                        }
                        .tint(.yellow)
                    }
                }
            }
        }
    }
}

struct SubscriptionRow: View {
    let subscription: Subscription

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: subscription.iconName)
                .font(.title3)
                .foregroundStyle(.white)
                .frame(width: 36, height: 36)
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 2) {
                Text(subscription.name)
                    .font(.body.bold())
                    .foregroundStyle(.white)
                Text("$\(String(format: "%.2f", subscription.price))/\(subscription.billingCycle.displayName.lowercased())")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Circle()
                .fill(Color(hex: subscription.status.color))
                .frame(width: 8, height: 8)
        }
        .padding(.vertical, 8)
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6:
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
    }
}
