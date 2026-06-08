import SwiftUI

struct ContactSupportView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var selectedSubject = "General"
    @State private var customSubject = ""
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""
    @State private var isSubmitting = false
    @State private var showSuccess = false
    @State private var errorMessage: String?

    private let subjects = ["General", "Feature Suggestion", "Bug Report", "Usage Question", "Performance Issue", "UI Improvement", "Other"]
    private let backendURL = "https://feedback-board.iocompile67692.workers.dev"

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    subjectSection
                    if selectedSubject == "Other" {
                        TextField("Custom subject...", text: $customSubject)
                            .textFieldStyle(.roundedBorder)
                    }
                    TextField("Your Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    TextEditor(text: $message)
                        .frame(minHeight: 120)
                        .padding(8)
                        .background(Color(.systemGray6).opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(.systemGray4), lineWidth: 1))
                        .overlay(alignment: .topLeading) {
                            if message.isEmpty {
                                Text("Your message...")
                                    .foregroundStyle(.secondary)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 16)
                                    .allowsHitTesting(false)
                            }
                        }

                    if let error = errorMessage {
                        Text(error)
                            .font(.caption)
                            .foregroundStyle(.red)
                    }

                    Button(action: submitFeedback) {
                        HStack {
                            if isSubmitting {
                                ProgressView()
                                    .tint(.white)
                            }
                            Text(isSubmitting ? "Sending..." : "Submit")
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    .disabled(isSubmitting || !isValid)
                }
                .padding()
            }
            .background(Color.black)
            .navigationTitle("Contact Support")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close") { dismiss() }
                }
            }
            .alert("Thank You!", isPresented: $showSuccess) {
                Button("OK") { dismiss() }
            } message: {
                Text("Your feedback has been submitted successfully.")
            }
        }
    }

    private var subjectSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Subject")
                .font(.subheadline.bold())
                .foregroundStyle(.white)
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                ForEach(subjects, id: \.self) { subject in
                    Button(action: { selectedSubject = subject }) {
                        Text(subject)
                            .font(.caption)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity)
                            .background(selectedSubject == subject ? Color.red.opacity(0.3) : Color(.systemGray6).opacity(0.3))
                            .foregroundStyle(selectedSubject == subject ? .red : .white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(selectedSubject == subject ? Color.red : Color.clear, lineWidth: 1))
                    }
                }
            }
        }
    }

    private var isValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty &&
        email.contains("@") &&
        !message.trimmingCharacters(in: .whitespaces).isEmpty
    }

    private func submitFeedback() {
        isSubmitting = true
        errorMessage = nil

        let subjectValue = selectedSubject == "Other" ? customSubject : selectedSubject
        let request = FeedbackRequest(
            name: name.trimmingCharacters(in: .whitespaces),
            email: email.trimmingCharacters(in: .whitespaces),
            subject: subjectValue,
            message: message.trimmingCharacters(in: .whitespaces),
            app_name: "SubKill"
        )

        guard let body = try? JSONEncoder().encode(request) else {
            errorMessage = "Failed to encode request"
            isSubmitting = false
            return
        }

        var urlRequest = URLRequest(url: URL(string: "\(backendURL)/api/feedback")!)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = body

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                isSubmitting = false
                if let error = error {
                    errorMessage = error.localizedDescription
                    return
                }
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    showSuccess = true
                } else {
                    errorMessage = "Failed to submit. Please try again."
                }
            }
        }.resume()
    }
}

struct FeedbackRequest: Codable {
    let name: String
    let email: String
    let subject: String
    let message: String
    let app_name: String
}
