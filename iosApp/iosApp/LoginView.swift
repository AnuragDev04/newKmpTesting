import SwiftUI
import shared   // KMP framework

struct LoginView: View {
    @State private var viewModel = LoginObservable()

var body: some View {
        VStack(spacing: 16) {
            Text("Welcome")
                .font(.system(size: 28, weight: .bold))

TextField("Email", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)

SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)

if let error = viewModel.error {
                Text(error)
                    .foregroundColor(.red)
                    .font(.footnote)
            }

Button {
                viewModel.login()
            } label: {
                HStack {
                    if viewModel.isLoading { ProgressView().tint(.white) }
                    Text(viewModel.isLoading ? "Signing in..." : "Login")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(viewModel.isLoading ? Color.gray : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .disabled(viewModel.isLoading)

if viewModel.isSuccess {
                Text("✅ Login successful!")
                    .foregroundColor(.green)
            }
        }
        .padding(24)
    }
}
