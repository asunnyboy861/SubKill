import Foundation
import StoreKit

@Observable
class StoreManager {
    static let shared = StoreManager()

    var isPro = false
    var isLoading = false
    var errorMessage: String?

    private let productID = "com.zzoutuo.SubKill.pro.lifetime"
    private var product: Product?
    private var transactionListener: Task<Void, Never>?

    var displayPrice: String {
        product?.displayPrice ?? "$9.99"
    }

    init() {
        transactionListener = listenForTransactions()
        Task {
            await loadProduct()
            await checkPurchased()
        }
    }

    deinit {
        transactionListener?.cancel()
    }

    func loadProduct() async {
        do {
            let products = try await Product.products(for: [productID])
            product = products.first
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func purchase() async -> Bool {
        guard let product = product else {
            await loadProduct()
            return false
        }

        isLoading = true
        defer { isLoading = false }

        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                let transaction = try checkVerified(verification)
                isPro = true
                await transaction.finish()
                return true
            case .userCancelled:
                return false
            case .pending:
                return false
            @unknown default:
                return false
            }
        } catch {
            errorMessage = error.localizedDescription
            return false
        }
    }

    func restorePurchases() async {
        do {
            try await AppStore.sync()
            await checkPurchased()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    private func checkPurchased() async {
        for await result in Transaction.currentEntitlements {
            if case .verified(let transaction) = result {
                if transaction.productID == productID {
                    isPro = transaction.revocationDate == nil
                    await transaction.finish()
                }
            }
        }
    }

    private func listenForTransactions() -> Task<Void, Never> {
        Task.detached { [productID] in
            for await result in Transaction.updates {
                guard case .verified(let transaction) = result else { continue }
                if transaction.productID == productID {
                    await MainActor.run {
                        self.isPro = transaction.revocationDate == nil
                    }
                }
                await transaction.finish()
            }
        }
    }

    private func checkVerified(_ result: VerificationResult<StoreKit.Transaction>) throws -> StoreKit.Transaction {
        switch result {
        case .unverified:
            throw StoreError.failedVerification
        case .verified(let transaction):
            return transaction
        }
    }
}

enum StoreError: Error {
    case failedVerification
}
