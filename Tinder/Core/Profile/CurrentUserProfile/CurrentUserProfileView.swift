//
//  CurrentUserProfileView.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/8/24.
//

import SwiftUI
import WebKit

struct CurrentUserProfileView: View {
    @EnvironmentObject var authManager: AuthManager
    
    @State private var showEditProfile = false

    let user: User

    var body: some View {
        NavigationStack {
            List {
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture {
                        showEditProfile.toggle()
                    }
                
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text(user.fullName)
                    }
                    
                    HStack {
                        Text("Email")
                        
                        Spacer()
                        
                        Text("test@example.com")
                    }
                }
                
                Section("Legal") {
                    LinkButton(title: "Terms of Service", URI: URL(string: LegalConstants.TOSURI)!)
                    
                    LinkButton(title: "Privacy Policy", URI: URL(string: LegalConstants.privacyPolicyURI)!)
                }
                
                Section {
                    Button {
                        authManager.signOut()
                    } label: {
                        Text("Logout")
                    }
                }
                .foregroundStyle(.red)
                
                Section {
                    Button {
                        
                    } label: {
                        Text("Delete Account")
                    }
                }
                .foregroundStyle(.red)
            }
            .navigationTitle("Prfile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user: user)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[1])
        .environmentObject(AuthManager(service: MockAuthService()))
}

struct LinkButton: View {
    @State private var sheet = false
    let title: String
    let URI: URL
    
    var body: some View {
        Button {
            sheet.toggle()
        } label: {
            Text(title)
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .sheet(isPresented: $sheet) {
            OuterWebView(uri: URI, title: title, sheet: $sheet)
        }
        .buttonStyle(.plain)
    }
}

struct OuterWebView: View {
    let uri: URL
    let title: String
    
    @Binding var sheet: Bool
    
    var body: some View {
        NavigationStack {
            WebView(url: uri)
                .ignoresSafeArea()
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            sheet.toggle()
                        } label: {
                            Text("Close")
                        }
                    }
                }
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    @State private var isLoading: Bool = true
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        var activityIndicator: UIActivityIndicatorView
        
        init(_ parent: WebView) {
            self.parent = parent
            self.activityIndicator = UIActivityIndicatorView(style: .large)
            self.activityIndicator.hidesWhenStopped = true
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
            showLoadingIndicator(on: webView)
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
            hideLoadingIndicator()
        }
        
        func showLoadingIndicator(on webView: WKWebView) {
            guard let superview = webView.superview else { return }
            
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            superview.addSubview(activityIndicator)
            
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
            
            activityIndicator.startAnimating()
        }
        
        func hideLoadingIndicator() {
            activityIndicator.stopAnimating()
        }
    }
}
