import SwiftUI

struct QuickAddView: View {
    let subscriptionVM: SubscriptionViewModel
    let onComplete: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Text("Quick Add Your Subscriptions")
                .font(.title2.bold())
                .foregroundStyle(.white)

            Text("Tap the ones you use — we'll set them up instantly")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(subscriptionVM.templates.prefix(15)) { template in
                        TemplateTile(template: template) {
                            subscriptionVM.addSubscription(from: template)
                        }
                    }
                }
                .padding(.horizontal)
            }

            Button(action: onComplete) {
                Text("Continue")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .padding(.horizontal, 32)
        }
        .background(Color.black)
    }
}

struct TemplateTile: View {
    let template: SubscriptionTemplate
    let onTap: () -> Void

    @State private var added = false

    var body: some View {
        Button(action: {
            if !added {
                added = true
                onTap()
            }
        }) {
            VStack(spacing: 8) {
                Image(systemName: template.iconName)
                    .font(.title2)
                    .foregroundStyle(added ? .green : .white)

                Text(template.name)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .lineLimit(1)

                Text("$\(String(format: "%.2f", template.defaultPrice))/\(template.billingCycle == .monthly ? "mo" : "yr")")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(added ? Color.green.opacity(0.15) : Color(.systemGray6).opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(added ? Color.green : Color.clear, lineWidth: 1)
            )
        }
        .disabled(added)
    }
}
