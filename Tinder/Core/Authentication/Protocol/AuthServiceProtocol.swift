//
//  AuthServiceProtocol.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/10/24.
//

import Foundation

@objc protocol AuthServiceProtocol {
    func createUser(withEmail email: String, password: String) async throws -> String
    func login(withEmail email: String, password: String) async throws -> String
    
    @objc optional func signOut()
}
