//
//  MatchManager.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/9/24.
//

import Foundation

@MainActor
class MatchManager: ObservableObject {
    @Published var matchedUser: User?
    @Published var matches = [Match]()
    
    private let service: MatchServiceProtocol
    
    init(service: MatchServiceProtocol) {
        self.service = service
    }
    
    func fetchMatches() async {
        do {
            self.matches = try await service.fetchMatches()
        } catch {
            print(error)
        }
    }
    
    func checkForMatch(withUser user: User) -> Void {
//        let didMatch = Bool.random()
//        
//        if didMatch {
//            matchedUser = user
//        }
        
        let didMatch = matches.firstIndex(where: { $0.userId == user.id }) != nil
        
        if didMatch {
            matchedUser = user
        }
    }
}
