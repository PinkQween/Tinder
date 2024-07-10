//
//  EmailView.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/10/24.
//

import SwiftUI

struct EmailView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var authDataStore: AuthDataStore
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Your email?")
                        .fontWeight(.bold)
                        .font(.title)
                    
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    
                    TextField("Enter email", text: $authDataStore.email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                    
                    Divider()
                }
                .padding()
                
                Spacer()
                
                NavigationLink {
                    PasswordView()
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

private extension EmailView {
    var subtitle: String {
        guard let authType = authManager.authType else { return "" }
        
        switch authType {
        case .createAccount:
            return "Don't lose access to your account, add your email"
        case .login:
        return "Enter the email associated oth your account to log back in"
        }
    }
}

#Preview {
    EmailView()
        .environmentObject(AuthManager(service: MockAuthService()))
        .environmentObject(AuthDataStore())
}
