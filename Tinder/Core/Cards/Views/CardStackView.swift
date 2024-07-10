//
//  CardStackView.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/1/24.
//

import SwiftUI

struct CardStackView: View {
    @EnvironmentObject var matchManager: MatchManager
    
    @State private var showMatchView = true
    
    @StateObject var viewModel = CardsViewModel(service: CardService())
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 16) {
                    ZStack {
                        VStack {
                            Text("That's all\nwe have for now!")
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.gray.opacity(0.6))
                                .fontWeight(.heavy)
                            
                            // TODO: Invite friends to help app grow
                        }
                        
                        ForEach(viewModel.cardModels) { model in
                            CardView(viewModel: viewModel, model: model)
                        }
                    }
                    if !viewModel.cardModels.isEmpty {
                        SwipeActionButtonsView(viewModel: viewModel)
                    }
                }
                .blur(radius: showMatchView ? 20 : 0)
                
                if showMatchView {
                    UserMatchView(show: $showMatchView)
                }
            }
            .animation(.easeInOut, value: showMatchView)
            .onReceive(matchManager.$matchedUser) { user in
                showMatchView = user != nil
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    if !showMatchView {
                        Image("tinder-logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 88)
                    }
                }
            }
        }
    }
}

#Preview {
    CardStackView()
        .environmentObject(MatchManager(service: MockMatchService()))
}
