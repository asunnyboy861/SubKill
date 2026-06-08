# SubKill - iOS Development Guide

## Executive Summary

**SubKill** is a privacy-first subscription management app that helps users track, manage, and cancel unwanted subscriptions — all without requiring bank credentials. The app positions itself as the "subscription killer" with a bold, action-oriented brand identity that resonates with users frustrated by hidden charges and difficult cancellation processes.

**Target Audience**: US-based iPhone users (25-45) who have 3+ active subscriptions and are concerned about overspending on recurring charges.

**Key Differentiators**:
1. **Privacy-First** — 100% local storage, zero data uploads, never asks for bank info
2. **Cancel-Oriented** — Not just tracking, but actively helping users kill unwanted subscriptions
3. **One-Time Purchase** — $9.99 lifetime Pro, no subscription irony
4. **Delightful UX** — "Kill" celebration animations create emotional satisfaction

**Market Opportunity**: Average US household spends $219/month on subscriptions but estimates only $86 (CNET 2026). 89% of users underestimate subscription costs by 2.5x.

## Competitive Analysis

| App | Price | Strengths | Weaknesses | SubKill Advantage |
|-----|-------|-----------|------------|-------------------|
| **Rocket Money** | $6-14/mo | Auto bank detection, bill negotiation, 3.5M+ users | Requires bank access, $48-156/yr, takes 50% of negotiated savings | Privacy-first, $9.99 once vs $156/yr, no bank access |
| **Bobby** | Free/$2.99 one-time | Beautiful iOS design, no bank needed, 4.8★ App Store | Manual entry only, no cancel guides, no price tracking | Template library, cancel guides, price tracking, celebration UX |
| **ReSubs** | Free/Premium | Privacy-first, AI extraction, cancel guides, multi-currency | Limited free tier, smaller service library | One-time purchase, richer features, "Kill" brand differentiation |
| **Kill the Sub** | $3 one-time | AI statement analysis, cancel links, privacy-focused | One-time audit (no ongoing monitoring), web-based | Ongoing monitoring, notifications, calendar, widget, iOS native |
| **YNAB** | $14.99/mo or $99/yr | Excellent budgeting, strong community | Overkill for subscription tracking, requires bank, steep learning curve | Focused on subscriptions, simple, no bank needed, $9.99 lifetime |

**SubKill's Unique Position**: The only iOS-native subscription tracker that combines privacy-first design, cancel-oriented UX with celebration animations, one-time purchase pricing, AND ongoing monitoring with notifications — all in a single app.

## Feature Inventory (MANDATORY — Every Feature Must Be Listed)

### Primary Features

| # | Feature | User Operation Flow | Data Input | Processing | Data Output | Persistence | Acceptance Criteria |
|---|---------|--------------------|------------|------------|-------------|-------------|---------------------|
| 1 | **Dashboard Overview** | 1. User opens app → 2. Dashboard auto-loads → 3. Monthly total, upcoming charges, trial alerts displayed | None (auto-calculated from subscriptions) | SubscriptionViewModel aggregates all active subs, calculates monthly/yearly totals, filters upcoming charges | Monthly total card, upcoming charges list, trial expiring section, active subscriptions list | SwiftData Subscription entities, in-memory CostReport | Dashboard shows correct totals matching subscription data; upcoming charges show within 7 days; trial alerts show within 3 days |
| 2 | **Add Subscription (Template)** | 1. User taps [+] → 2. Search bar appears → 3. User types service name → 4. Template matches shown → 5. User taps template → 6. Pre-filled form appears → 7. User confirms | Service name (search query), optional price/cycle adjustments | TemplateSearcher filters SubscriptionTemplates.json by name/searchTerms/category | Pre-filled AddSubscriptionView with template defaults | SubscriptionTemplates.json (bundled), new Subscription entity saved to SwiftData | Template search returns relevant results in real-time; tapping template pre-fills all fields; subscription saves correctly |
| 3 | **Add Subscription (Manual)** | 1. User taps [+] → 2. Scrolls past templates → 3. Fills manual form (name, price, currency, cycle, next date, category, trial, cancel URL, notes) → 4. Taps "Add Subscription" | Name (String), Price (Double), Currency (String), BillingCycle (enum), NextPaymentDate (Date), Category (String), IsTrial (Bool), TrialEndDate (Date?), CancelURL (String?), Notes (String) | SubscriptionValidator checks: name non-empty, price > 0, cycle valid, nextDate >= today | New Subscription entity persisted to SwiftData | SwiftData Subscription entity | Validation prevents invalid entries; subscription appears in dashboard immediately; notification scheduled |
| 4 | **Cancel Guide** | 1. User taps subscription → 2. Detail view opens → 3. User taps "Kill This Subscription" → 4. Cancel guide appears with step-by-step instructions → 5. User taps "Open [Service]" to jump to cancel page → 6. User returns and taps "I've Cancelled" → 7. Celebration animation plays | Subscription cancelURL and CancelGuideProvider data | CancelGuideProvider returns step-by-step instructions for known services; Safari opens cancel URL | Step-by-step cancel instructions, "Open [Service]" button, "I've Cancelled" confirmation button | CancelGuideProvider (bundled JSON), Subscription status updated to .cancelled | Cancel guide shows correct steps for service; Safari opens correct URL; marking cancelled triggers celebration; subscription removed from monthly total |
| 5 | **Notification Engine** | 1. User adds subscription → 2. NotificationManager schedules reminders → 3. User receives push notification before charge/trial expiry/price change → 4. User taps notification → 5. App opens to subscription detail | Subscription nextPaymentDate, trialEndDate, priceHistory | NotificationManager calculates reminder dates (3 days before charge, 1 day before trial end, immediate for price change); schedules UNCalendarNotificationTrigger | Local notifications with custom actions: "Kill It" / "Keep It" for charges, "Cancel Now" / "Remind Tomorrow" for trials | UNUserNotificationCenter pending requests, subscription ID in userInfo | Notifications fire at correct times; tapping notification opens correct subscription; action buttons work; notifications cancel when subscription cancelled |
| 6 | **Stats & Analytics** | 1. User taps Stats tab → 2. Stats view loads → 3. Total saved, monthly breakdown by category, spending trend chart, price changes displayed | All Subscription entities (active + cancelled) | CostReport calculation: monthlyTotal, yearlyTotal, categoryBreakdown, totalSaved, upcomingCharges, priceChanges | Total saved card, category bar chart, 6-month spending trend line chart, price change alerts | In-memory CostReport computed from SwiftData | Stats show correct totals; category breakdown sums to 100%; trend chart shows 6 months; price changes highlight increases |
| 7 | **Calendar View** | 1. User taps Calendar tab → 2. Monthly calendar loads → 3. Charge dates highlighted with colored dots → 4. User taps date → 5. Charges for that day listed | All active Subscription nextPaymentDate values | Calendar groups subscriptions by nextPaymentDate; color-codes by urgency | Monthly calendar with charge indicators, day detail list | In-memory, computed from SwiftData | Calendar shows correct charge dates; tapping date shows all charges for that day; color coding reflects urgency |
| 8 | **Widget** | 1. User adds SubKill widget to home screen → 2. Widget shows upcoming charges and monthly total → 3. User taps widget → 4. App opens to dashboard | All active Subscription entities | Widget timeline provider fetches subscriptions, calculates next charge, formats display | Home screen widget showing: monthly total, next charge name + amount + days until | WidgetKit timeline, reads from SwiftData App Group container | Widget displays correct data; updates on timeline; tapping opens app |
| 9 | **Price Change Tracking** | 1. User edits subscription price → 2. PriceChange record auto-created → 3. If price increased, notification sent → 4. Price history visible in subscription detail | Old price (Double), New price (Double) | PriceTracker compares old vs new price; creates PriceChange entity; triggers notification if increase | Price change notification, price history list in detail view, price change section in Stats | SwiftData PriceChange entity with relationship to Subscription | Price change recorded correctly; notification sent for increases; history shows all changes with dates |
| 10 | **Trial Countdown** | 1. User adds subscription with isTrial=true + trialEndDate → 2. Dashboard shows trial countdown → 3. Notifications sent 3 days and 1 day before expiry → 4. User can cancel before being charged | isTrial (Bool), trialEndDate (Date) | Calculates days remaining; schedules trial expiry notifications; auto-converts to active if not cancelled | Trial countdown badge on subscription card, trial expiring section in dashboard, trial notifications | SwiftData Subscription.isTrial/trialEndDate | Countdown shows correct days; notifications fire at 3 and 1 day before; subscription converts to active after trial end |
| 11 | **Savings Report** | 1. Monthly push notification or user taps Stats → 2. Savings report shows: total saved, cancelled subscriptions, price changes detected, comparison vs last month | Cancelled Subscription entities with monthlyPrice and cancellation date | Calculates: totalSaved = sum of (cancelled sub monthlyPrice × months since cancel); month-over-month comparison | Monthly savings summary, cancelled subscription list, savings trend | In-memory, computed from SwiftData | Savings correctly calculated; month comparison accurate; report shows actionable insights |
| 12 | **Onboarding Flow** | 1. First launch → 2. Welcome screen with privacy badge → 3. Quick Add template picker → 4. Notification permission request → 5. Dashboard shown | Template selections (tap to add), notification permission grant | Template selections create Subscription entities; notification permission stored | WelcomeView → QuickAddView → NotificationSetupView → DashboardView | UserDefaults isFirstLaunch, SwiftData new subscriptions | Onboarding completes in <30 seconds; selected templates create subscriptions; notification permission requested after value shown |
| 13 | **Settings** | 1. User taps Settings tab → 2. Settings view shows: Pro upgrade, notification preferences, currency, biometric lock, iCloud sync, export CSV, about, privacy policy, terms → 3. User adjusts preferences | User selections for each setting | SettingsViewModel manages UserDefaults, StoreManager handles Pro purchase, biometric auth via LocalAuthentication | Settings UI with toggles/pickers, Pro paywall, biometric prompt | UserDefaults for preferences, Keychain for purchase, LocalAuthentication | All settings persist correctly; Pro purchase works; biometric lock activates; CSV export generates valid file; iCloud sync works |
| 14 | **Subscription State Machine** | 1. Subscription starts as Active/Trial → 2. User can: cancel (→ Cancelled), pause (→ Paused), edit price (→ PriceChange recorded) → 3. Trial auto-converts to Active on trialEndDate → 4. Cancelled subscriptions move to Expired after service end date | Status transitions triggered by user actions or date checks | Subscription.cancel(), .pause(), .resume(), .updatePrice(), .convertTrialToActive() methods | Status badge on subscription card, filtered lists, notification scheduling changes | SwiftData Subscription.status field | State transitions work correctly; cancelled subs removed from monthly total; paused subs stop notifications; trial auto-converts |

### Sub-Features & Detail Interactions

| # | Parent Feature | Sub-Feature | Detail Description | Interaction Pattern |
|---|---------------|-------------|-------------------|--------------------|
| 1.1 | Dashboard | Monthly Total Card | Red gradient card showing monthly total (48pt bold), yearly total, active count | Auto-displayed, tap to see breakdown |
| 1.2 | Dashboard | Upcoming Charges Section | Red warning section listing subscriptions charging within 7 days | Auto-displayed when charges exist |
| 1.3 | Dashboard | Trial Expiring Section | Orange warning section with "Cancel Now" CTA button | Auto-displayed when trials expiring |
| 1.4 | Dashboard | Active Subscriptions List | Scrollable list with logo, name, price/cycle, status dot | Scroll, tap to open detail |
| 2.1 | Add Subscription | Template Search | Real-time fuzzy search across template name, searchTerms, category | Type in search bar, results filter instantly |
| 2.2 | Add Subscription | Template Grid | 3-column grid of popular service templates with logo + name + default price | Tap to select, long-press to edit price |
| 4.1 | Cancel Guide | Cancel Steps | Numbered step-by-step instructions for cancelling each service | Read steps, tap "Open [Service]" to jump to cancel page |
| 4.2 | Cancel Guide | Celebration Animation | Explosion particles + "KILLED!" text + savings amount + green color transition | Triggered by tapping "I've Cancelled" button |
| 4.3 | Cancel Guide | Share Win | Share sheet with savings amount for social sharing | Tap "Share My Win" button |
| 5.1 | Notifications | Charge Reminder | Notification 1-3 days before nextPaymentDate with "Kill It" / "Keep It" actions | Tap notification action or tap to open app |
| 5.2 | Notifications | Trial Expiry Reminder | Notification 3 and 1 days before trialEndDate with "Cancel Now" / "Remind Tomorrow" actions | Tap notification action |
| 5.3 | Notifications | Price Increase Alert | Immediate notification when price increase detected with "View" / "Cancel Sub" actions | Tap notification action |
| 6.1 | Stats | Category Bar Chart | Horizontal bar chart showing spending by category | Scroll to see all categories |
| 6.2 | Stats | Spending Trend | 6-month line chart showing total spending trend | Pinch to zoom, scroll horizontally |
| 8.1 | Widget | Upcoming Charge Widget | Shows next charge name, amount, and days until | Tap to open app |
| 13.1 | Settings | Pro Paywall | One-time $9.99 purchase with feature list and "No subscription irony" tagline | Tap "Unlock Pro" button, StoreKit purchase flow |
| 13.2 | Settings | CSV Export | Exports all subscriptions to CSV file | Tap "Export Data", share sheet appears |
| 13.3 | Settings | Biometric Lock | Face ID / Touch ID lock for app access | Toggle on, biometric prompt on app launch |
| 14.1 | State Machine | Swipe Actions | Left swipe: "Kill" (red) + "Pause" (yellow); Right swipe: "Details" (blue) | Swipe on subscription row |

### Cross-Feature Dependencies

| Dependency | Source Feature | Target Feature | Data Passed | Trigger Condition |
|------------|---------------|----------------|-------------|-------------------|
| Add sub → Dashboard update | Add Subscription | Dashboard | New Subscription entity | Subscription saved successfully |
| Add sub → Notification schedule | Add Subscription | Notification Engine | Subscription nextPaymentDate, trialEndDate | Subscription saved with valid dates |
| Cancel sub → Savings update | Cancel Guide | Stats & Savings Report | Cancelled Subscription with monthlyPrice | User confirms "I've Cancelled" |
| Cancel sub → Notification cancel | Cancel Guide | Notification Engine | Subscription ID | Subscription status → .cancelled |
| Price edit → Price change record | Subscription Detail | Price Change Tracking | Old price, new price | User updates subscription price |
| Price edit → Price notification | Subscription Detail | Notification Engine | PriceChange data | New price > old price |
| Trial end → Status conversion | Trial Countdown | Subscription State Machine | Subscription with isTrial=true | trialEndDate <= today |
| Onboarding → Subscriptions created | Onboarding Flow | Dashboard | Template selections as Subscription entities | User completes quick add step |
| Widget → App launch | Widget | Dashboard | Deep link to subscription or dashboard | User taps widget |
| Settings → Pro features unlock | Settings (Pro Purchase) | All Pro-gated features | isPro boolean | StoreKit purchase completed |

## Apple Design Guidelines Compliance

- **Navigation**: Tab bar with 4 tabs (Dashboard, Calendar, Stats, Settings) — follows HIG recommendation of 3-5 tabs
- **Touch Targets**: All interactive elements minimum 44x44pt
- **Safe Areas**: Content respects safe areas; backgrounds extend edge-to-edge
- **Dark Mode**: Full dark mode support with semantic colors; pure black background for OLED
- **Dynamic Type**: Key text elements support Dynamic Type (.large through .xxxLarge)
- **Accessibility**: VoiceOver labels on all interactive elements; accessibilityReduceMotion support for celebration animations
- **Haptic Feedback**: UIImpactFeedbackGenerator on "Kill" confirmation
- **Liquid Glass**: Use standard SwiftUI components that adopt Liquid Glass automatically on iOS 26
- **Privacy**: No data collection; privacy-first messaging in onboarding; biometric lock option
- **Notifications**: User-initiated permission request (after onboarding value shown); custom notification categories with action buttons

## Technical Architecture

- **Language**: Swift 5.9+
- **Framework**: SwiftUI (primary), no UIKit
- **Data**: SwiftData with iCloud sync (NSUbiquitousKeyValueStore)
- **Notifications**: UNUserNotificationCenter (local only, no remote push)
- **Payments**: StoreKit 2 (one-time purchase)
- **Widgets**: WidgetKit
- **Auth**: LocalAuthentication (Face ID / Touch ID)
- **Concurrency**: async/await + Task (structured concurrency)
- **Architecture**: MVVM with @Observable + @Model
- **No third-party dependencies**: 100% Apple native frameworks

## Module Structure

```
SubKill/
├── SubKillApp.swift                     # App entry point
├── Models/
│   ├── Subscription.swift               # SwiftData subscription model
│   ├── PriceChange.swift                # SwiftData price change model
│   ├── CostReport.swift                 # Computed cost report struct
│   ├── BillingCycle.swift               # Billing cycle enum
│   └── SubscriptionStatus.swift         # Status enum
├── ViewModels/
│   ├── SubscriptionViewModel.swift      # Subscription CRUD + validation
│   ├── DashboardViewModel.swift         # Dashboard data aggregation
│   ├── StatsViewModel.swift             # Stats & analytics calculations
│   └── SettingsViewModel.swift          # Settings & Pro management
├── Views/
│   ├── Onboarding/
│   │   ├── WelcomeView.swift            # Privacy-first welcome
│   │   ├── QuickAddView.swift           # Template picker onboarding
│   │   └── NotificationSetupView.swift  # Notification permission
│   ├── Dashboard/
│   │   ├── DashboardView.swift          # Main dashboard
│   │   ├── MonthlyTotalCard.swift       # Red gradient total card
│   │   ├── UpcomingChargeCard.swift     # Charge warning card
│   │   ├── TrialExpiringCard.swift      # Trial warning card
│   │   └── SubscriptionRow.swift        # Subscription list row
│   ├── Subscription/
│   │   ├── AddSubscriptionView.swift    # Add sub (template + manual)
│   │   ├── TemplatePickerView.swift     # Template search & grid
│   │   ├── SubscriptionDetailView.swift # Sub detail & edit
│   │   ├── CancelGuideView.swift        # Step-by-step cancel guide
│   │   └── CancelCelebrationView.swift  # Kill celebration animation
│   ├── Calendar/
│   │   └── CalendarView.swift           # Charge calendar
│   ├── Stats/
│   │   └── StatsView.swift              # Analytics & savings
│   └── Settings/
│       ├── SettingsView.swift           # Settings main
│       └── ProPaywallView.swift         # Pro upgrade paywall
├── Services/
│   ├── NotificationManager.swift        # Local notification scheduling
│   ├── CancelGuideProvider.swift        # Cancel guide data provider
│   ├── StoreManager.swift               # StoreKit 2 one-time purchase
│   └── SubscriptionValidator.swift      # Input validation
├── Widgets/
│   ├── SubKillWidget.swift              # Home screen widget
│   └── SubKillWidgetBundle.swift        # Widget bundle entry
├── Resources/
│   ├── Assets.xcassets                  # App icons & colors
│   └── SubscriptionTemplates.json       # Built-in template data
└── Extensions/
    ├── Date+Extensions.swift            # Date helpers
    ├── Color+Extensions.swift           # App color palette
    └── Double+Currency.swift            # Currency formatting
```

## Data Flow Diagram (MANDATORY — Every Feature's Data Lifecycle)

### Feature 1: Dashboard Overview
```
┌───────────────────────────────────────────────────────────┐
│  User Input: None (auto-loads on app launch)              │
│       │                                                   │
│  ViewModel Processing                                     │
│  └── DashboardViewModel.swift                            │
│      → @Query fetches all Subscription where status != .cancelled │
│      → Calculates monthlyTotal = sum(price × monthlyMultiplier) │
│      → Calculates yearlyTotal = sum(price × yearlyMultiplier) │
│      → Filters upcomingCharges = daysUntilNextCharge <= 7 │
│      → Filters trialExpiring = isTrial && trialDaysRemaining <= 3 │
│       │                                                   │
│  Model/Persistence                                        │
│  └── SwiftData Subscription entities (read-only)          │
│       │                                                   │
│  Display Output                                           │
│  └── MonthlyTotalCard (monthly/yearly/active count)      │
│  └── UpcomingChargesSection (list of upcoming subs)      │
│  └── TrialExpiringSection (list of expiring trials)      │
│  └── ActiveSubscriptionsList (all active subs)           │
│       │                                                   │
│  Cross-Feature Output                                     │
│  └── Data consumed by Stats (same base query)            │
│  └── Data consumed by Widget (via App Group)             │
└───────────────────────────────────────────────────────────┘
```

### Feature 2-3: Add Subscription (Template + Manual)
```
┌───────────────────────────────────────────────────────────┐
│  User Input: Template selection OR manual form fields     │
│       │                                                   │
│  ViewModel Processing                                     │
│  └── SubscriptionViewModel.swift                         │
│      → Template: TemplateSearcher.search(query) filters  │
│      → Manual: SubscriptionValidator.validate() checks   │
│      → Creates Subscription entity with all fields       │
│      → modelContext.insert(subscription)                 │
│       │                                                   │
│  Model/Persistence                                        │
│  └── SwiftData: new Subscription entity persisted        │
│  └── SubscriptionTemplates.json: read-only template data │
│       │                                                   │
│  Display Output                                           │
│  └── Dashboard updates automatically via @Query          │
│  └── New subscription appears in active list             │
│       │                                                   │
│  Cross-Feature Output                                     │
│  └── NotificationManager.scheduleChargeReminder(sub)     │
│  └── NotificationManager.scheduleTrialExpiryReminder(sub)│
│  └── Widget timeline reloads                              │
└───────────────────────────────────────────────────────────┘
```

### Feature 4: Cancel Guide
```
┌───────────────────────────────────────────────────────────┐
│  User Input: Tap "Kill This Subscription" → confirm cancel│
│       │                                                   │
│  ViewModel Processing                                     │
│  └── SubscriptionViewModel.cancel(subscription)          │
│      → subscription.cancel() sets status = .cancelled    │
│      → NotificationManager.cancelNotifications(sub.id)   │
│      → Calculates savedAmount = monthlyCost × 12         │
│       │                                                   │
│  Model/Persistence                                        │
│  └── SwiftData: Subscription.status updated to .cancelled│
│  └── UNUserNotificationCenter: pending requests removed  │
│       │                                                   │
│  Display Output                                           │
│  └── CancelCelebrationView: explosion + "KILLED!" + savings│
│  └── Dashboard: subscription removed from monthly total  │
│  └── Stats: savings amount updated                       │
│       │                                                   │
│  Cross-Feature Output                                     │
│  └── StatsViewModel.totalSaved includes new cancellation │
│  └── Widget: updated without cancelled sub               │
└───────────────────────────────────────────────────────────┘
```

### Feature 5: Notification Engine
```
┌───────────────────────────────────────────────────────────┐
│  User Input: None (background/system triggered)           │
│       │                                                   │
│  ViewModel Processing                                     │
│  └── NotificationManager.swift                           │
│      → scheduleChargeReminder: triggerDate = nextPaymentDate - 1 day │
│      → scheduleTrialExpiryReminder: triggers at 3 and 1 day before │
│      → schedulePriceChangeReminder: immediate trigger    │
│      → registerNotificationCategories: CHARGE_REMINDER,  │
│        TRIAL_EXPIRY, PRICE_CHANGE with action buttons    │
│       │                                                   │
│  Model/Persistence                                        │
│  └── UNUserNotificationCenter: pending notification requests │
│  └── Notification userInfo: subscriptionId for deep link │
│       │                                                   │
│  Display Output                                           │
│  └── System notification banner with action buttons      │
│  └── Tapping notification → opens app to subscription detail│
│       │                                                   │
│  Cross-Feature Output                                     │
│  └── "Kill It" action → Cancel Guide flow               │
│  └── "Keep It" action → dismiss, next reminder scheduled │
└───────────────────────────────────────────────────────────┘
```

### Feature 9: Price Change Tracking
```
┌───────────────────────────────────────────────────────────┐
│  User Input: Edit subscription price in detail view       │
│       │                                                   │
│  ViewModel Processing                                     │
│  └── SubscriptionViewModel.updatePrice(sub, newPrice)    │
│      → subscription.updatePrice(newPrice) creates PriceChange│
│      → Compares old vs new price                          │
│      → If increase: NotificationManager.schedulePriceChangeReminder│
│       │                                                   │
│  Model/Persistence                                        │
│  └── SwiftData: PriceChange entity created (cascade relationship)│
│  └── SwiftData: Subscription.price updated               │
│       │                                                   │
│  Display Output                                           │
│  └── Subscription detail: price history list             │
│  └── Stats: Price Changes section shows increases        │
│  └── Notification: "{name} raised to ${newPrice}"        │
│       │                                                   │
│  Cross-Feature Output                                     │
│  └── Dashboard: monthly total reflects new price         │
│  └── Stats: category breakdown updated                   │
└───────────────────────────────────────────────────────────┘
```

### Feature 13: Settings & Pro Purchase
```
┌───────────────────────────────────────────────────────────┐
│  User Input: Tap "Unlock Pro" → StoreKit purchase flow    │
│       │                                                   │
│  ViewModel Processing                                     │
│  └── SettingsViewModel.swift                             │
│      → StoreManager.purchase(product) → StoreKit 2 flow  │
│      → Transaction.verified → purchasedProductIDs updated │
│      → isPro computed from purchasedProductIDs           │
│       │                                                   │
│  Model/Persistence                                        │
│  └── StoreKit 2: Transaction persisted by system         │
│  └── App Group: isPro status available to Widget         │
│       │                                                   │
│  Display Output                                           │
│  └── Pro features unlocked: unlimited subs, calendar, etc│
│  └── Paywall dismissed                                   │
│       │                                                   │
│  Cross-Feature Output                                     │
│  └── All views check StoreManager.isPro for feature gating│
│  └── Widget: Pro features available                      │
└───────────────────────────────────────────────────────────┘
```

## Implementation Flow

1. Create Xcode project with SwiftData + SwiftUI, configure Bundle ID, signing, capabilities (iCloud, Notifications, Widget, App Group)
2. Implement data models: Subscription, PriceChange, BillingCycle, SubscriptionStatus, CostReport
3. Create SubscriptionTemplates.json with 30+ popular services
4. Implement SubscriptionViewModel with CRUD operations and validation
5. Build Onboarding flow: WelcomeView → QuickAddView → NotificationSetupView
6. Build Dashboard: MonthlyTotalCard, UpcomingChargesSection, TrialExpiringSection, ActiveSubscriptionsList
7. Build Add Subscription: TemplatePickerView with search + AddSubscriptionView manual form
8. Build Subscription Detail + Cancel Guide + Cancel Celebration animation
9. Implement NotificationManager with charge, trial, and price change reminders
10. Build Calendar View with charge date indicators
11. Build Stats View with category breakdown, spending trend, price changes, savings
12. Implement StoreManager with StoreKit 2 one-time purchase
13. Build Settings View with Pro paywall, preferences, biometric lock, CSV export
14. Implement Widget with timeline provider
15. Add accessibility: VoiceOver labels, Dynamic Type, reduce motion support
16. Test on iPhone and iPad simulators

## UI/UX Design Specifications

- **Color Scheme**: Dark theme primary. Red (#FF3B30) for "Kill" actions, Orange (#FF9500) for warnings, Green (#34C759) for savings, Pure Black (#000000) background, Surface (#1C1C1E) cards
- **Typography**: SF Pro Rounded for display/titles, SF Pro for body, SF Mono for currency amounts
- **Layout**: 8pt grid system, 16pt card padding, 24pt section spacing, 32pt page margins
- **Corner Radius**: 8pt small elements, 12pt buttons, 16pt cards, 20pt modals
- **Animations**: Spring-based cancel celebration (explosion particles + scale + opacity), reduce motion fallback to opacity-only
- **Tab Bar**: 4 tabs — Dashboard (house), Calendar (calendar), Stats (chart.bar), Settings (gearshape)
- **Gestures**: Left swipe for Kill/Pause, right swipe for Details, pull-to-refresh on Dashboard

## Code Generation Rules

- One feature per module, high cohesion, low coupling
- SwiftData + @Observable architecture (no CoreData + ObservableObject)
- 100% SwiftUI, no UIKit wrapping
- async/await + Task for all async operations (no completion handlers)
- Local notifications only (no Firebase/APNs)
- All data 100% local (SwiftData + iCloud private database)
- No third-party dependencies (100% Apple native frameworks)
- Semantic naming, clear file structure
- Never add comments in code unless asked
- Apple native first: prioritize SwiftUI/SwiftData/StoreKit2
- Free tier: max 5 subscriptions; Pro: unlimited + all features
- StoreManager.isPro gates Pro features in views

## Build & Deployment Checklist

1. Xcode project configured with com.zzoutuo.SubKill bundle ID
2. Capabilities enabled: iCloud (CloudKit), Push Notifications, App Groups, Widget
3. StoreKit 2 product configured: com.zzoutuo.SubKill.pro.lifetime ($9.99)
4. App Group configured for Widget data sharing
5. Info.plist: NSUserNotificationsUsageDescription, NSFaceIDUsageDescription
6. Test on iPhone 15 Pro simulator (iOS 17.0+)
7. Test on iPad simulator (adaptive layout)
8. Test dark mode + dynamic type + VoiceOver
9. Archive and upload to App Store Connect
10. Submit for review with Finance category, 4+ age rating

## GitHub Reference Projects

| Project | URL | Usage |
|---------|-----|-------|
| dimeApp | https://github.com/rafsoh/dimeApp | Reference for RecurringExpense model, iCloud sync, Widget, Charts |
| SmartSpend | https://github.com/JohnUfo/SmartSpend | Reference for smart categorization, CSV import, Widget |
| Wallos | https://github.com/ellite/Wallos | Reference for subscription logo search, multi-currency, notification system |
| SwiftyStoreKit | https://github.com/bizz84/SwiftyStoreKit | Reference for IAP implementation patterns (though we use StoreKit 2 natively) |
