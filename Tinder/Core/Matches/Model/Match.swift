//
//  Match.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/9/24.
//

import Foundation

struct Match: Codable, Identifiable, Hashable {
    var id: String
    let userId: String
    let timestamp: Date
    
    var user: User?
}
