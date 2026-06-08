# Capabilities Configuration

## Analysis
Based on operation guide analysis, the following capabilities are required:

| Keyword Found | Capability | Required |
|---------------|-----------|----------|
| 通知/提醒/notification/alert | Push Notifications | YES |
| 同步/iCloud/sync | iCloud | YES |
| 购买/Pro/premium/买断 | In-App Purchase | YES |
| 后台/刷新/background | Background Modes | YES |
| Widget/主屏 | App Groups (Widget data sharing) | YES |
| 生物识别/Face ID/Touch ID | LocalAuthentication | NO (framework only, no capability) |
| StoreKit2 | In-App Purchase | YES (same as above) |

## Auto-Configured Capabilities
| Capability | Status | Method |
|------------|--------|--------|
| Push Notifications | CONFIGURED | SubKill.entitlements (aps-environment: development) |
| iCloud | CONFIGURED | SubKill.entitlements (container + key-value store) |
| In-App Purchase | CONFIGURED | SubKill.entitlements (com.zzoutuo.SubKill.pro.lifetime) |
| Background Modes | CONFIGURED | SubKill.entitlements (fetch + processing) |
| App Groups | CONFIGURED | SubKill.entitlements (group.com.zzoutuo.SubKill) |
| LocalAuthentication | N/A | Framework-only, no entitlement needed |

## Manual Configuration Required
| Capability | Status | Steps |
|------------|--------|-------|
| iCloud CloudKit Container | PENDING | 1. Open Apple Developer Portal → Identifiers → App IDs → com.zzoutuo.SubKill → Enable iCloud with CloudKit 2. Create CloudKit container "iCloud.com.zzoutuo.SubKill" in Containers section |
| App Store Connect IAP | PENDING | 1. Open App Store Connect → SubKill app → In-App Purchases → Create "SubKill Pro (Lifetime)" with product ID "com.zzoutuo.SubKill.pro.lifetime", price $9.99 |
| Sign in with Apple | PENDING | 1. Open Apple Developer Portal → Certificates, Identifiers & Profiles → App IDs → Enable "Sign in with Apple" 2. This is optional for SubKill but included for future use |

## No Configuration Needed
- HealthKit: Not required (finance app, not health)
- Location Services: Not required
- Camera/Photo Library: Not required
- Siri: Not required
- Apple Watch: Not required (future consideration)
- Maps: Not required

## Verification
- Entitlements file created: YES
- Build verification: PENDING (will verify in build step)
