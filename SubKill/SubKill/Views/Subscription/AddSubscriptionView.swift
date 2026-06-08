import SwiftUI

struct AddSubscriptionView: View {
    let subscriptionVM: SubscriptionViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""
    @State private var price = ""
    @State private var currency = "USD"
    @State private var billingCycle: BillingCycle = .monthly
    @State private var nextPaymentDate = Date().addingTimeInterval(86400 * 30)
    @State private var category = "Other"
    @State private var isTrial = false
    @State private var trialEndDate = Date().addingTimeInterval(86400 * 7)
    @State private var cancelURL = ""
    @State private var notes = ""
    @State private var showTemplatePicker = true
    @State private var searchQuery = ""

    private let categories = ["Entertainment", "Music", "Productivity", "Business", "Cloud Storage", "Design", "Developer", "Security", "News", "Fitness", "Health", "Games", "Shopping", "Other"]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    templateSection

                    Divider().overlay(.white.opacity(0.2))

                    manualFormSection
                }
                .padding()
            }
            .background(Color.black)
            .navigationTitle("Add Subscription")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") { addSubscription() }
                        .disabled(!isValid)
                }
            }
        }
    }

    private var templateSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Quick Add from Template")
                .font(.headline)
                .foregroundStyle(.white)

            TextField("Search services...", text: $searchQuery)
                .textFieldStyle(.roundedBorder)
                .onChange(of: searchQuery) { _, _ in subscriptionVM.searchText = searchQuery }

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    ForEach(subscriptionVM.filteredTemplates.prefix(12)) { template in
                        Button(action: { fillFromTemplate(template) }) {
                            HStack(spacing: 6) {
                                Image(systemName: template.iconName)
                                    .font(.caption)
                                Text(template.name)
                                    .font(.caption)
                                    .lineLimit(1)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Color(.systemGray5).opacity(0.5))
                            .clipShape(Capsule())
                        }
                        .foregroundStyle(.white)
                    }
                }
            }
        }
    }

    private var manualFormSection: some View {
        VStack(spacing: 16) {
            Text("Manual Entry")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            TextField("Service Name", text: $name)
                .textFieldStyle(.roundedBorder)

            HStack {
                TextField("Price", text: $price)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)

                Picker("Cycle", selection: $billingCycle) {
                    ForEach(BillingCycle.allCases, id: \.self) { cycle in
                        Text(cycle.displayName).tag(cycle)
                    }
                }
                .pickerStyle(.menu)
            }

            DatePicker("Next Payment", selection: $nextPaymentDate, in: Date()..., displayedComponents: .date)

            Picker("Category", selection: $category) {
                ForEach(categories, id: \.self) { cat in
                    Text(cat).tag(cat)
                }
            }
            .pickerStyle(.menu)

            Toggle("Free Trial", isOn: $isTrial)

            if isTrial {
                DatePicker("Trial Ends", selection: $trialEndDate, in: Date()..., displayedComponents: .date)
            }

            TextField("Cancel URL (optional)", text: $cancelURL)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)

            TextField("Notes (optional)", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(2...4)
        }
    }

    private var isValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty &&
        Double(price) ?? 0 > 0
    }

    private func fillFromTemplate(_ template: SubscriptionTemplate) {
        name = template.name
        price = String(format: "%.2f", template.defaultPrice)
        billingCycle = template.billingCycle
        category = template.category
        cancelURL = template.cancelURL ?? ""
    }

    private func addSubscription() {
        guard let priceValue = Double(price), priceValue > 0 else { return }
        let success = subscriptionVM.addSubscription(
            name: name,
            price: priceValue,
            currency: currency,
            billingCycle: billingCycle,
            nextPaymentDate: nextPaymentDate,
            category: category,
            isTrial: isTrial,
            trialEndDate: isTrial ? trialEndDate : nil,
            cancelURL: cancelURL.isEmpty ? nil : cancelURL,
            notes: notes.isEmpty ? nil : notes
        )
        if success {
            dismiss()
        }
    }
}
