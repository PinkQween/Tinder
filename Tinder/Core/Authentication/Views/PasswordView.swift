//
//  PasswordView.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/10/24.
//

import SwiftUI

struct PasswordView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var authDataStore: AuthDataStore
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Your password?")
                        .fontWeight(.bold)
                        .font(.title)
                    
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    
                    SecureField("Enter password", text: $authDataStore.password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                        .textContentType(authManager.authType == .createAccount ? .newPassword : .password)
                    
                    Divider()
                }
                .navigationBarBackButtonHidden()
                .padding()
                
                Spacer()
                
                Button {
                    onNextTapped()
                } label: {
                    Text("Next")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 340, height: 50)
                        .background(Color("PrimaryPink"))
                        .clipShape(Capsule())
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .fontWeight(.heavy)
                            .foregroundStyle(Color(.primaryText))
                    }
                }
            }
        }
    }
}

private extension PasswordView {
    var subtitle: String {
        guard let authType = authManager.authType else { return "" }
        
        switch authType {
        case .createAccount:
            return "Don't lose access to your account, add your password"
        case .login:
        return "Enter the password associated oth your account to log back in"
        }
    }
    
    func onNextTapped() {
        Task {
            await authManager.authenticate(
                withEmail: authDataStore.email,
                password: authDataStore.password
            )
        }
    }
}

#Preview {
    PasswordView()
        .environmentObject(AuthManager(service: MockAuthService()))
        .environmentObject(AuthDataStore())
}
