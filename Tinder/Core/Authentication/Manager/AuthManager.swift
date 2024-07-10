//
//  AuthManager.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/10/24.
//

import Foundation
<<<<<<< HEAD
//import FirebaseAuth
=======
import FirebaseAuth
>>>>>>> 5a1b4f5368335d8d14783497d6356adac7ede048

@MainActor
class AuthManager: ObservableObject {
    @Published var authType: AuthType?
    @Published var authState: AuthState = .unauthenticated
    
    private let service: AuthServiceProtocol
    
    init(service: AuthServiceProtocol) {
        self.service = service
        
<<<<<<< HEAD
//        if let currentUID = Auth.auth().currentUser?.uid {
//            self.authState = .authenticated(currentUID)
//        }
=======
        if let currentUID = Auth.auth().currentUser?.uid {
            self.authState = .authenticated(currentUID)
        }
>>>>>>> 5a1b4f5368335d8d14783497d6356adac7ede048
    }
    
    func authenticate(withEmail email: String, password: String) async {
        guard let authType else { return }
        
        do {
            switch authType {
            case .createAccount:
                let uid = try await service.createUser(withEmail: email, password: password)
                self.authState = .authenticated(uid)
            case .login:
                let uid = try await service.login(withEmail: email, password: password)
                self.authState = .authenticated(uid)
            }
        } catch {
            print(error)
        }
    }
    
    func signOut() {
        authType = nil
        authState = .unauthenticated
        if let service = service as? AuthService {
            service.signOut()
        }
    }
}
