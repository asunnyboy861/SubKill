import SwiftUI
import Charts

struct StatsView: View {
    let subscriptionVM: SubscriptionViewModel
    @State private var statsVM = StatsViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    totalSavedCard
                    monthlyBreakdownCard
                    spendingTrendCard
                    priceChangesCard
                    cancelledSubsCard
                }
                .padding()
            }
            .background(Color.black)
            .navigationTitle("Stats")
            .onAppear { statsVM.load(subscriptionVM: subscriptionVM) }
        }
    }

    private var totalSavedCard: some View {
        VStack(spacing: 12) {
            Text("Total Saved")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("$\(String(format: "%.2f", statsVM.totalSaved))")
                .font(.system(size: 42, weight: .bold, design: .rounded))
                .foregroundStyle(.green)

            HStack(spacing: 24) {
                Label("$\(String(format: "%.2f", statsVM.monthlyTotal))/mo", systemImage: "flame")
                    .font(.caption)
                    .foregroundStyle(.red)
                Label("$\(String(format: "%.0f", statsVM.yearlyTotal))/yr", systemImage: "calendar")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.green.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.green.opacity(0.3), lineWidth: 1))
    }

    private var monthlyBreakdownCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Spending by Category")
                .font(.headline)
                .foregroundStyle(.white)

            let sorted = statsVM.categoryBreakdown.sorted { $0.value > $1.value }
            let maxVal = sorted.first?.value ?? 1

            ForEach(sorted, id: \.key) { cat, amount in
                HStack {
                    Text(cat)
                        .font(.caption)
                        .foregroundStyle(.white)
                        .frame(width: 100, alignment: .leading)
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.red)
                        .frame(width: max(20, CGFloat(amount / maxVal) * 160), height: 16)
                    Text("$\(String(format: "%.2f", amount))")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6).opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var spendingTrendCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("6-Month Trend")
                .font(.headline)
                .foregroundStyle(.white)

            if #available(iOS 16.0, *) {
                Chart(statsVM.spendingTrend) { item in
                    LineMark(
                        x: .value("Month", item.month),
                        y: .value("Total", item.total)
                    )
                    .foregroundStyle(.red)
                    .interpolationMethod(.catmullRom)

                    AreaMark(
                        x: .value("Month", item.month),
                        y: .value("Total", item.total)
                    )
                    .foregroundStyle(.red.opacity(0.1))
                    .interpolationMethod(.catmullRom)
                }
                .frame(height: 160)
                .chartYAxis {
                    AxisMarks(position: .leading) { value in
                        AxisValueLabel {
                            if let val = value.as(Double.self) {
                                Text("$\(String(format: "%.0f", val))")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color(.systemGray6).opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var priceChangesCard: some View {
        Group {
            if !statsVM.recentPriceChanges.isEmpty {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Price Changes")
                        .font(.headline)
                        .foregroundStyle(.white)

                    ForEach(statsVM.recentPriceChanges.prefix(5), id: \.changedAt) { change in
                        if let subName = change.subscription?.name {
                            HStack {
                                Text(subName)
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                Spacer()
                                Text("$\(String(format: "%.2f", change.oldPrice))")
                                    .font(.caption)
                                    .strikethrough()
                                    .foregroundStyle(.secondary)
                                Image(systemName: "arrow.right")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                                Text("$\(String(format: "%.2f", change.newPrice))")
                                    .font(.caption.bold())
                                    .foregroundStyle(change.isIncrease ? .red : .green)
                            }
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6).opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
    }

    private var cancelledSubsCard: some View {
        Group {
            if !statsVM.cancelledSubscriptions.isEmpty {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Cancelled Subscriptions")
                        .font(.headline)
                        .foregroundStyle(.white)

                    ForEach(statsVM.cancelledSubscriptions, id: \.name) { sub in
                        HStack {
                            Image(systemName: sub.iconName)
                                .foregroundStyle(.white)
                            Text(sub.name)
                                .font(.caption)
                                .foregroundStyle(.white)
                            Spacer()
                            Text("$\(String(format: "%.2f", sub.monthlyPrice))/mo saved")
                                .font(.caption2)
                                .foregroundStyle(.green)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6).opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
    }
}
