//
//  MainTabBar.swift
//  Tinder
//
//  Created by Hanna Skairipa on 6/28/24.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var matchManager = MatchManager(service: MockMatchService())
                 
    var body: some View {
        TabView {
            CardStackView()
                .tabItem { Image(systemName: "flame") }
                .tag(0)
            
            Text("Search View")
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(1)
            
            InboxView()
                .tabItem {
                    Image(systemName: "bubble")
                }
                .tag(2)
            
            CurrentUserProfileView(user: MockData.users[1])
                .tabItem { Image(systemName: "person") }
                .tag(3)
        }
        .environmentObject(matchManager)
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
        .environmentObject(MatchManager(service: MockMatchService()))
        .environmentObject(AuthManager(service: MockAuthService()))
}
