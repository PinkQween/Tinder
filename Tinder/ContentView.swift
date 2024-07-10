//
//  ContentView.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        Group {
            switch authManager.authState {
            case .unauthenticated:
                AuthenticationRootView()
                    .environmentObject(AuthDataStore())
            case .authenticated:
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthManager(service: MockAuthService()))
}
