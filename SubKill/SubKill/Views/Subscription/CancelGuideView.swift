import SwiftUI

struct CancelGuideView: View {
    let subscription: Subscription
    let subscriptionVM: SubscriptionViewModel
    @Binding var showCelebration: Bool
    @Environment(\.dismiss) private var dismiss

    private let guide = CancelGuideProvider.getGuide(for: "", cancelURL: nil)

    var body: some View {
        let cancelGuide = CancelGuideProvider.getGuide(for: subscription.name, cancelURL: subscription.cancelURL)

        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    difficultyBadge(cancelGuide)

                    ForEach(cancelGuide.steps) { step in
                        stepCard(step)
                    }

                    if let url = cancelGuide.cancelURL, let destination = URL(string: url) {
                        Link(destination: destination) {
                            Label("Open \(subscription.name)", systemImage: "safari")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                    }

                    Button(action: confirmCancellation) {
                        Label("I've Cancelled!", systemImage: "checkmark.circle")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                }
                .padding()
            }
            .background(Color.black)
            .navigationTitle("Cancel Guide")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }

    private func difficultyBadge(_ guide: CancelGuideProvider.CancelGuide) -> some View {
        HStack {
            Text("Difficulty:")
                .foregroundStyle(.secondary)
            Text(guide.difficulty)
                .bold()
                .foregroundStyle(guide.difficulty == "Easy" ? .green : guide.difficulty == "Hard" ? .red : .orange)
        }
        .font(.subheadline)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color(.systemGray6).opacity(0.3))
        .clipShape(Capsule())
    }

    private func stepCard(_ step: CancelGuideProvider.CancelStep) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(step.stepNumber)")
                .font(.title3.bold())
                .foregroundStyle(.red)
                .frame(width: 32, height: 32)
                .background(Color.red.opacity(0.15))
                .clipShape(Circle())

            Text(step.instruction)
                .font(.body)
                .foregroundStyle(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6).opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    private func confirmCancellation() {
        subscriptionVM.cancelSubscription(subscription)
        NotificationManager.shared.cancelNotifications(for: subscription.name)
        dismiss()
        showCelebration = true
    }
}
