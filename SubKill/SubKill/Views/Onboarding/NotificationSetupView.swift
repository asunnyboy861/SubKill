import SwiftUI

struct NotificationSetupView: View {
    let onComplete: () -> Void

    @State private var isRequesting = false

    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            Image(systemName: "bell.badge")
                .font(.system(size: 64, weight: .bold))
                .foregroundStyle(.orange)

            Text("Never Miss a Charge")
                .font(.title.bold())
                .foregroundStyle(.white)

            Text("Get reminders before you're charged and alerts when trials expire. Stay in control of your money.")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Spacer()

            Button(action: requestPermission) {
                HStack {
                    if isRequesting {
                        ProgressView()
                            .tint(.white)
                    }
                    Text(isRequesting ? "Setting Up..." : "Enable Notifications")
                        .font(.headline)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            .padding(.horizontal, 32)
            .disabled(isRequesting)

            Button("Skip for Now") {
                onComplete()
            }
            .foregroundStyle(.secondary)
            .padding(.bottom, 48)
        }
        .background(Color.black)
    }

    private func requestPermission() {
        isRequesting = true
        Task {
            _ = await NotificationManager.shared.requestAuthorization()
            NotificationManager.shared.registerNotificationCategories()
            onComplete()
        }
    }
}
