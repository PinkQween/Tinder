//
//  MockMatchService.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/9/24.
//

struct MockMatchService: MatchServiceProtocol {
    func fetchMatches() async throws -> [Match] {
        return MockData.matches
    }
}
