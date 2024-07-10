//
//  AuthType.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/10/24.
//

enum AuthType: Int, Identifiable {
    case createAccount, login
    
    var id: Int { return self.rawValue}
}
