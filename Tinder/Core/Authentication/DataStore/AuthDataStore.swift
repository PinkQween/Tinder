//
//  AuthDataStore.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/10/24.
//

import Foundation

class AuthDataStore: ObservableObject {
    @Published var email = ""
    @Published var password = ""
}
