import SwiftUI

struct SubscriptionDetailView: View {
    let subscription: Subscription
    let subscriptionVM: SubscriptionViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var showCancelGuide = false
    @State private var showCelebration = false
    @State private var editingPrice = false
    @State private var newPrice = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                headerCard
                detailsCard
                priceHistoryCard
                actionButtons
            }
            .padding()
        }
        .background(Color.black)
        .navigationTitle(subscription.name)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showCancelGuide) {
            CancelGuideView(subscription: subscription, subscriptionVM: subscriptionVM, showCelebration: $showCelebration)
        }
        .fullScreenCover(isPresented: $showCelebration) {
            CancelCelebrationView(subscription: subscription) {
                showCelebration = false
                dismiss()
            }
        }
        .alert("Edit Price", isPresented: $editingPrice) {
            TextField("New price", text: $newPrice)
                .keyboardType(.decimalPad)
            Button("Cancel", role: .cancel) {}
            Button("Save") {
                if let price = Double(newPrice), price > 0 {
                    subscriptionVM.updatePrice(subscription, newPrice: price)
                }
            }
        } message: {
            Text("Enter the new price for \(subscription.name)")
        }
    }

    private var headerCard: some View {
        VStack(spacing: 16) {
            Image(systemName: subscription.iconName)
                .font(.system(size: 48))
                .foregroundStyle(.white)
                .frame(width: 80, height: 80)
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 16))

            Text(subscription.name)
                .font(.title2.bold())
                .foregroundStyle(.white)

            HStack(spacing: 4) {
                Text("$\(String(format: "%.2f", subscription.price))")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                Text("/\(subscription.billingCycle.displayName.lowercased())")
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }

            HStack(spacing: 8) {
                Text(subscription.status.displayName)
                    .font(.caption.bold())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color(hex: subscription.status.color).opacity(0.2))
                    .foregroundStyle(Color(hex: subscription.status.color))
                    .clipShape(Capsule())

                if subscription.isTrial, let days = subscription.daysUntilTrialEnd {
                    Text("\(days)d trial left")
                        .font(.caption.bold())
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color.orange.opacity(0.2))
                        .foregroundStyle(.orange)
                        .clipShape(Capsule())
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6).opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var detailsCard: some View {
        VStack(spacing: 12) {
            DetailRow(label: "Category", value: subscription.category)
            DetailRow(label: "Next Payment", value: subscription.nextPaymentDate.formatted(date: .abbreviated, time: .omitted))
            DetailRow(label: "Monthly Cost", value: "$\(String(format: "%.2f", subscription.monthlyPrice))")
            DetailRow(label: "Yearly Cost", value: "$\(String(format: "%.2f", subscription.yearlyPrice))")
            if let url = subscription.cancelURL, !url.isEmpty {
                DetailRow(label: "Cancel URL", value: "Available")
            }
            if let notes = subscription.notes, !notes.isEmpty {
                DetailRow(label: "Notes", value: notes)
            }
        }
        .padding()
        .background(Color(.systemGray6).opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var priceHistoryCard: some View {
        Group {
            if !subscription.priceChanges.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Price History")
                        .font(.headline)
                        .foregroundStyle(.white)

                    ForEach(subscription.priceChanges, id: \.changedAt) { change in
                        HStack {
                            Text(change.changedAt.formatted(date: .abbreviated, time: .omitted))
                                .font(.caption)
                                .foregroundStyle(.secondary)
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
                .padding()
                .background(Color(.systemGray6).opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
    }

    private var actionButtons: some View {
        VStack(spacing: 12) {
            if subscription.status == .active || subscription.status == .trial {
                Button(action: { showCancelGuide = true }) {
                    Label("Kill This Subscription", systemImage: "target")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)

                HStack(spacing: 12) {
                    Button(action: { subscriptionVM.pauseSubscription(subscription) }) {
                        Label("Pause", systemImage: "pause")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                    }
                    .buttonStyle(.bordered)
                    .tint(.yellow)

                    Button(action: { editingPrice = true; newPrice = String(format: "%.2f", subscription.price) }) {
                        Label("Edit Price", systemImage: "pencil")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                    }
                    .buttonStyle(.bordered)
                }
            } else if subscription.status == .paused {
                Button(action: { subscriptionVM.resumeSubscription(subscription) }) {
                    Label("Resume", systemImage: "play")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
            }
        }
    }
}

struct DetailRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
                .foregroundStyle(.white)
                .multilineTextAlignment(.trailing)
        }
        .font(.subheadline)
    }
}
