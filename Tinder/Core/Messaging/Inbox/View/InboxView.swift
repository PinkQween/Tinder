//
//  InboxView.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/9/24.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        NavigationStack {
            List {
                NewMatchesView()
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Matches")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    InboxView()
        .environmentObject(MatchManager(service: MockMatchService()))
}
