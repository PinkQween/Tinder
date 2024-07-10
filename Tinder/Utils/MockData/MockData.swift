//
//  MockData.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/2/24.
//

import Foundation

struct MockData {
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            fullName: "Megan Fox",
            age: 38,
            profileImageURLs: [
                "megan-fox-1",
                "megan-fox-2",
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Kelly Johnson",
            age: 46,
            profileImageURLs: [
                "kelly1",
                "kelly2",
                "kelly3",
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Jane Doe",
            age: 37,
            profileImageURLs: [
                "jane1",
                "jane2",
                "jane3",
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "David Beckham",
            age: 49,
            profileImageURLs: [
                "david-beckham-1",
                "david-beckham-2",
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Conor Mcgregor",
            age: 35,
            profileImageURLs: [
                "conor-mcgregor-1",
                "conor-mcgregor-2",
                "conor-mcgregor-3",
            ]
        ),
    ]
}

extension MockData {
    static var matches: [Match] = [
        .init(
            id: NSUUID().uuidString,
            userId: users[0].id,
            timestamp: Date(),
            user: users[0]
        ),
        .init(
            id: NSUUID().uuidString,
            userId: users[2].id,
            timestamp: Date(),
            user: users[2]
        ),
        .init(
            id: NSUUID().uuidString,
            userId: users[3].id,
            timestamp: Date(),
            user: users[3]
        ),
    ]
}
