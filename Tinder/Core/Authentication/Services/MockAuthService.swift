//
//  MockAuthService.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/10/24.
//

import Foundation

class MockAuthService: AuthServiceProtocol {
    func createUser(withEmail email: String, password: String) async throws -> String {
        return NSUUID().uuidString
    }
    
    func login(withEmail email: String, password: String) async throws -> String {
        return NSUUID().uuidString
    }
}
