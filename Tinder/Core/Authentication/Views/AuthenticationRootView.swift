//
//  AithenticationRootView.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/10/24.
//

import SwiftUI

struct AuthenticationRootView: View {
    @EnvironmentObject var authManager: AuthManager
    
    @State var showAuthFlow = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("tinder-logo-white")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 40)
                    .padding()
                
                VStack(spacing: 8) {
                    Text("It Starts ").bold() +
                    Text("with")
                    
                    Text("a ") +
                    Text("Swipe").bold()
                }
                .font(.largeTitle)
                .foregroundColor(.white)
                
                Spacer()
                
                VStack(spacing: 20) {
                    Text("By tapping 'Sign in' you agree to our Terms. Learn how we proccess your data in our Privacy Policy and Cookies Policy")
                        .multilineTextAlignment(.center)
                        .font(.footnote)
                        .foregroundStyle(.white)
                    
                    Button {
                        authManager.authType = .createAccount
                    } label: {
                        Text("Create Account")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .frame(width: 340, height: 50)
                            .background(.white)
                            .clipShape(Capsule())
                        
                    }
                    
                    Button {
                        authManager.authType = .login
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(width: 340, height: 50)
                        
                    }
                    .overlay {
                        Capsule()
                            .stroke(.white, lineWidth: 1.5)
                    }
                    
                    NavigationLink {
                        Text("Forgot password")
                    } label: {
                        Text("Trouble signing in?")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal, 30)
            }
            .fullScreenCover(item: $authManager.authType) { type in
                EmailView()
            }
            .frame(maxWidth: .infinity)
            .background(gradientBackground)
        }
    }
}

private extension AuthenticationRootView {
    var gradientBackground: LinearGradient {
        LinearGradient(colors: [Color("TertiaryPink"), Color("PrimaryPink"), Color("SecondaryPink")], startPoint: .topTrailing, endPoint: .bottomLeading)
    }
}

#Preview {
    AuthenticationRootView()
        .environmentObject(AuthManager(service: MockAuthService()))
        .environmentObject(AuthDataStore())
}
