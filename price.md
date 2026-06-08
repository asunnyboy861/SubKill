# Pricing Configuration

## Monetization Model: Free + One-Time Purchase (Non-Consumable IAP)

SubKill uses a free-to-download model with a one-time in-app purchase to unlock Pro features. This deliberately avoids subscription pricing to eliminate the "subscription irony" of charging a subscription to manage subscriptions.

## App Store Connect Pricing

- **App Price**: Free (Tier 0)
- **Category**: Finance
- **Age Rating**: 4+

## Free Tier

| Feature | Free | Pro |
|---------|------|-----|
| Add subscriptions | Up to 5 | Unlimited |
| Monthly/Yearly total cost | YES | YES |
| Charge reminders | 1 day before | 1/3/7 days (customizable) |
| Template library | YES (all templates) | YES |
| Cancel guide (jump to URL) | YES | YES |
| Calendar view | NO | YES |
| Price change tracking | NO | YES |
| Trial countdown | NO | YES |
| Savings report | NO | YES |
| Home screen Widget | NO | YES |
| Custom categories | NO | YES |
| CSV data export | NO | YES |
| Biometric lock | NO | YES |
| iCloud sync | NO | YES |

## In-App Purchase

### SubKill Pro (Lifetime)
- **Reference Name**: SubKill Pro Lifetime
- **Product ID**: `com.zzoutuo.SubKill.pro.lifetime`
- **Type**: Non-Consumable
- **Price**: $9.99 (Tier 8)
- **Display Name**: SubKill Pro (≤ 35 chars)
- **Description**: Unlock all features forever. One-time purchase, no subscription. (≤ 55 chars)
- **Localization**: English (US)

### Launch Promotion
- **First 2 weeks**: $4.99 (50% off) — for early adopter acquisition
- **Holiday sales**: $6.99 (30% off) — Black Friday / Christmas

## Competitive Pricing Analysis

| App | Annual Cost | SubKill Advantage |
|-----|------------|-------------------|
| Rocket Money | $72-156/yr | $9.99 once vs $156/yr |
| Bobby | $35-60/yr | $9.99 once vs $60/yr |
| ReSubs | $24/yr | $9.99 once vs $24/yr |
| Subtrack | $20-36/yr | $9.99 once vs $36/yr |
| **SubKill** | **$9.99 lifetime** | **Best value, zero irony** |

## Revenue Projection

- Monthly downloads (conservative): 5,000
- Free-to-Pro conversion rate: 10%
- Monthly revenue: 5,000 × 10% × $9.99 × 70% (after Apple cut) = $3,496/month
- Annual revenue: $41,955/year

## Policy Pages Required
- Support Page: YES
- Privacy Policy: YES
- Terms of Use: YES (required for IAP apps)

## Apple IAP Compliance Checklist
- [x] One-time purchase clearly stated
- [x] No auto-renewal (non-consumable)
- [x] Restore purchases functionality implemented
- [x] Price clearly displayed in Paywall
- [x] Privacy Policy link in Paywall
- [x] Terms of Use link in Paywall
- [x] Feature comparison table visible before purchase
