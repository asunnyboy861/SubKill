import Foundation

struct CancelGuideProvider {
    struct CancelStep: Identifiable {
        let id = UUID()
        let stepNumber: Int
        let instruction: String
        let actionTitle: String?
    }

    struct CancelGuide: Identifiable {
        let id = UUID()
        let serviceName: String
        let steps: [CancelStep]
        let cancelURL: String?
        let difficulty: String
    }

    static func getGuide(for serviceName: String, cancelURL: String?) -> CancelGuide {
        let knownGuides: [String: CancelGuide] = [
            "Netflix": CancelGuide(
                serviceName: "Netflix",
                steps: [
                    CancelStep(stepNumber: 1, instruction: "Open Netflix.com and sign in", actionTitle: "Open Netflix"),
                    CancelStep(stepNumber: 2, instruction: "Click your profile icon → Account", actionTitle: nil),
                    CancelStep(stepNumber: 3, instruction: "Click 'Cancel Membership' under Membership & Billing", actionTitle: nil),
                    CancelStep(stepNumber: 4, instruction: "Click 'Finish Cancellation' to confirm", actionTitle: nil)
                ],
                cancelURL: "https://www.netflix.com/cancelplan",
                difficulty: "Easy"
            ),
            "Spotify": CancelGuide(
                serviceName: "Spotify",
                steps: [
                    CancelStep(stepNumber: 1, instruction: "Open Spotify.com and log in", actionTitle: "Open Spotify"),
                    CancelStep(stepNumber: 2, instruction: "Go to Account → Manage your plan", actionTitle: nil),
                    CancelStep(stepNumber: 3, instruction: "Click 'Change or Cancel'", actionTitle: nil),
                    CancelStep(stepNumber: 4, instruction: "Click 'Cancel Premium' and confirm", actionTitle: nil)
                ],
                cancelURL: "https://www.spotify.com/account/subscription/",
                difficulty: "Easy"
            ),
            "YouTube Premium": CancelGuide(
                serviceName: "YouTube Premium",
                steps: [
                    CancelStep(stepNumber: 1, instruction: "Open YouTube.com and sign in", actionTitle: "Open YouTube"),
                    CancelStep(stepNumber: 2, instruction: "Click your avatar → Purchases and memberships", actionTitle: nil),
                    CancelStep(stepNumber: 3, instruction: "Click 'Manage Membership' next to YouTube Premium", actionTitle: nil),
                    CancelStep(stepNumber: 4, instruction: "Click 'Deactivate' → 'Continue to cancel'", actionTitle: nil)
                ],
                cancelURL: "https://www.youtube.com/paid_memberships",
                difficulty: "Medium"
            ),
            "Apple Music": CancelGuide(
                serviceName: "Apple Music",
                steps: [
                    CancelStep(stepNumber: 1, instruction: "Open Settings → Your Name → Subscriptions", actionTitle: nil),
                    CancelStep(stepNumber: 2, instruction: "Tap 'Apple Music'", actionTitle: nil),
                    CancelStep(stepNumber: 3, instruction: "Tap 'Cancel Subscription' and confirm", actionTitle: nil)
                ],
                cancelURL: nil,
                difficulty: "Easy"
            ),
            "Amazon Prime": CancelGuide(
                serviceName: "Amazon Prime",
                steps: [
                    CancelStep(stepNumber: 1, instruction: "Open Amazon.com and sign in", actionTitle: "Open Amazon"),
                    CancelStep(stepNumber: 2, instruction: "Go to Account → Prime Membership", actionTitle: nil),
                    CancelStep(stepNumber: 3, instruction: "Click 'Manage Membership' → 'End Membership'", actionTitle: nil),
                    CancelStep(stepNumber: 4, instruction: "Click 'I do not want my benefits' to confirm", actionTitle: nil)
                ],
                cancelURL: "https://www.amazon.com/mypremium",
                difficulty: "Hard"
            )
        ]

        if let guide = knownGuides[serviceName] {
            return guide
        }

        return CancelGuide(
            serviceName: serviceName,
            steps: [
                CancelStep(stepNumber: 1, instruction: "Visit the service's website or app", actionTitle: cancelURL != nil ? "Open \(serviceName)" : nil),
                CancelStep(stepNumber: 2, instruction: "Navigate to Account Settings or Subscription Management", actionTitle: nil),
                CancelStep(stepNumber: 3, instruction: "Look for 'Cancel', 'Unsubscribe', or 'End Membership'", actionTitle: nil),
                CancelStep(stepNumber: 4, instruction: "Follow the prompts to confirm cancellation", actionTitle: nil)
            ],
            cancelURL: cancelURL,
            difficulty: "Varies"
        )
    }
}
