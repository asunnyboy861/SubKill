import SwiftUI

struct WelcomeView: View {
    let onComplete: () -> Void

    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            Image(systemName: "target")
                .font(.system(size: 80, weight: .bold))
                .foregroundStyle(.red)

            Text("SubKill")
                .font(.system(size: 42, weight: .bold, design: .rounded))
                .foregroundStyle(.white)

            Text("Kill unwanted subscriptions.\nSave money. Stay private.")
                .font(.title3)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            HStack(spacing: 12) {
                Label("100% Local", systemImage: "lock.shield")
                Label("No Bank Info", systemImage: "creditcard.slash")
                Label("Private", systemImage: "hand.raised")
            }
            .font(.caption)
            .foregroundStyle(.green)

            Spacer()

            Button(action: onComplete) {
                Text("Get Started")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .padding(.horizontal, 32)
            .padding(.bottom, 48)
        }
        .background(Color.black)
    }
}
