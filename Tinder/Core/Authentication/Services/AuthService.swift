//
//  AuthService.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/10/24.
//

import Foundation
<<<<<<< HEAD
//import FirebaseAuth

class AuthService: AuthServiceProtocol {
    func createUser(withEmail email: String, password: String) async throws -> String {
//        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        
//        return result.user.uid
        
        return NSUUID().uuidString
    }
    
    func login(withEmail email: String, password: String) async throws -> String {
//        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        
//        return result.user.uid
        
        return NSUUID().uuidString
    }
    
    func signOut() {
//        do {
//            try Auth.auth().signOut()
//        } catch {
//            print(error)
//        }
=======
import FirebaseAuth

class AuthService: AuthServiceProtocol {
    func createUser(withEmail email: String, password: String) async throws -> String {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        
        return result.user.uid
    }
    
    func login(withEmail email: String, password: String) async throws -> String {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        
        return result.user.uid
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
>>>>>>> 5a1b4f5368335d8d14783497d6356adac7ede048
    }
}

