//
//  CardModel.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/1/24.
//

struct CardModel {
    let user: User
}

extension CardModel: Identifiable, Hashable {
    var id: String { return user.id }
}
