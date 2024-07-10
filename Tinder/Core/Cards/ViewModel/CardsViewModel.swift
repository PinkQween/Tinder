//
//  CardsViewModel.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/1/24.
//

import Foundation

@MainActor
class CardsViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    @Published var buttonSwipeAction: SwipeAction?
    
    private let service: CardService
    
    init(service: CardService) {
        self.service = service
        Task { await fetchCardModeles() }
    }
    
    func fetchCardModeles() async {
        do {
            self.cardModels = try await service.fetchCardModels()
        } catch {
            print(error)
        }
    }
    
    func removeCard(_ card: CardModel) {
        guard let index = cardModels.firstIndex(where:  { $0.id == card.id }) else { return }
        
        cardModels.remove(at: index)
    }
}
