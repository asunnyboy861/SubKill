import SwiftUI
import SwiftData

@main
struct SubKillApp: App {
    @AppStorage("isFirstLaunch") private var isFirstLaunch = true
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Subscription.self, PriceChange.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            if !hasCompletedOnboarding {
                OnboardingContainer(hasCompletedOnboarding: $hasCompletedOnboarding, modelContext: sharedModelContainer.mainContext)
            } else {
                MainTabView(modelContext: sharedModelContainer.mainContext)
            }
        }
        .modelContainer(sharedModelContainer)
    }
}

struct OnboardingContainer: View {
    @Binding var hasCompletedOnboarding: Bool
    let modelContext: ModelContext
    @State private var step = 0

    var body: some View {
        Group {
            switch step {
            case 0:
                WelcomeView { step = 1 }
            case 1:
                QuickAddView(subscriptionVM: SubscriptionViewModel(modelContext: modelContext)) { step = 2 }
            case 2:
                NotificationSetupView { hasCompletedOnboarding = true }
            default:
                EmptyView()
            }
        }
        .transition(.opacity)
    }
}

struct MainTabView: View {
    let modelContext: ModelContext
    @State private var subscriptionVM: SubscriptionViewModel
    @State private var settingsVM = SettingsViewModel()

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        _subscriptionVM = State(initialValue: SubscriptionViewModel(modelContext: modelContext))
    }

    var body: some View {
        TabView {
            DashboardView(subscriptionVM: subscriptionVM)
                .tabItem { Label("Dashboard", systemImage: "house") }
            CalendarView(subscriptionVM: subscriptionVM)
                .tabItem { Label("Calendar", systemImage: "calendar") }
            StatsView(subscriptionVM: subscriptionVM)
                .tabItem { Label("Stats", systemImage: "chart.bar") }
            SettingsView(subscriptionVM: subscriptionVM)
                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
        .tint(.red)
    }
}
