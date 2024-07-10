//
//  CardService.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/1/24.
//

struct CardService {
    func fetchCardModels() async throws -> [CardModel] {
        return MockData.users.map({ CardModel(user: $0) })
    }
}
