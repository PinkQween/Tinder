//
//  MatchService.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/9/24.
//

protocol MatchServiceProtocol {
    func fetchMatches() async throws -> [Match]
}

struct MatchService: MatchServiceProtocol {
    func fetchMatches() async throws -> [Match] {
        return []
    }
}
