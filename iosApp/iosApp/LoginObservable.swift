import SwiftUI
import shared

@MainActor
final class LoginObservable: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var error: String?
    @Published var isSuccess = false

private let viewModel = LoginViewModel()

init() {
        viewModel.onStateChanged = { [weak self] state in
            guard let self else { return }
            self.email = state.email
            self.password = state.password
            self.isLoading = state.isLoading
            self.error = state.error
            self.isSuccess = state.isSuccess
        }
    }

func login() {
        viewModel.updateEmail(value: email)
        viewModel.updatePassword(value: password)
        viewModel.login()
    }
}
