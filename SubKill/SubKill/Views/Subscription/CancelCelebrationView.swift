import SwiftUI

struct CancelCelebrationView: View {
    let subscription: Subscription
    let onDismiss: () -> Void

    @State private var scale: CGFloat = 0.01
    @State private var opacity: Double = 0
    @State private var particles: [Particle] = []
    @State private var showSavings = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ForEach(particles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: particle.size, height: particle.size)
                    .position(particle.position)
                    .opacity(particle.opacity)
            }

            VStack(spacing: 24) {
                Spacer()

                Text("KILLED!")
                    .font(.system(size: 64, weight: .black, design: .rounded))
                    .foregroundStyle(.green)
                    .scaleEffect(scale)

                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.green)
                    .scaleEffect(scale)

                Text("\(subscription.name) is dead.")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .opacity(opacity)

                if showSavings {
                    VStack(spacing: 8) {
                        Text("You'll save")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Text("$\(String(format: "%.2f", subscription.monthlyPrice))/mo")
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundStyle(.green)
                        Text("$\(String(format: "%.2f", subscription.yearlyPrice))/yr")
                            .font(.title3)
                            .foregroundStyle(.green.opacity(0.7))
                    }
                    .transition(.scale.combined(with: .opacity))
                }

                Spacer()

                Button(action: onDismiss) {
                    Text("Done")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .padding(.horizontal, 32)
                .padding(.bottom, 48)
            }
        }
        .onAppear {
            spawnParticles()
            withAnimation(.spring(response: 0.6, dampingFraction: 0.5)) {
                scale = 1.0
            }
            withAnimation(.easeIn.delay(0.3)) {
                opacity = 1.0
            }
            withAnimation(.spring(response: 0.5).delay(0.8)) {
                showSavings = true
            }
        }
    }

    private func spawnParticles() {
        let colors: [Color] = [.red, .green, .orange, .yellow, .blue, .purple, .pink]
        for i in 0..<30 {
            let particle = Particle(
                id: i,
                position: CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2),
                color: colors[i % colors.count].opacity(0.8),
                size: CGFloat.random(in: 6...14),
                opacity: 1.0
            )
            particles.append(particle)

            withAnimation(.easeOut(duration: 1.0).delay(Double(i) * 0.03)) {
                particles[i].position = CGPoint(
                    x: CGFloat.random(in: 40...UIScreen.main.bounds.width - 40),
                    y: CGFloat.random(in: 100...UIScreen.main.bounds.height - 200)
                )
                particles[i].opacity = 0
            }
        }
    }
}

struct Particle: Identifiable {
    let id: Int
    var position: CGPoint
    let color: Color
    let size: CGFloat
    var opacity: Double
}
