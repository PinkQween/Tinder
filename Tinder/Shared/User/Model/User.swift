//
//  User.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/1/24.
//

struct User: Codable, Identifiable, Hashable {
    let id: String
    let fullName: String
    let age: Int
    let profileImageURLs: [String]
}

extension User {
    var firstName: String {
        let components = fullName.components(separatedBy: " ")
        
        return components[0]
    }
}
