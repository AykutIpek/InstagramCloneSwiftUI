//
//  User.swift
//  InstagramClone
//
//  Created by aykut ipek on 17.07.2023.
//

import Foundation


struct User: Identifiable,Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
    
}

extension User{
    static var MOCK_USERS: [User] = [
        .init(id: UUID().uuidString, username: "aykut", profileImageUrl: "Me", fullName: "Aykut İpek", bio: "iOS Developer", email: "aykut.ipek@gmail.com"),
        .init(id: UUID().uuidString, username: "deadpool", profileImageUrl: "deadpool", fullName: "Deadpool", bio: "Deadpoll always original", email: "deadpool@hotmail.com"),
        .init(id: UUID().uuidString, username: "ironman", profileImageUrl: "ironman", fullName: "Tony Stark", bio: "Playboy", email: "ironman@gmail.com"),
        .init(id: UUID().uuidString, username: "blackpanther", profileImageUrl: "blackpanther", fullName: nil, bio: "Gothams dark night", email: "blackpanther@gmail.com"),
        .init(id: UUID().uuidString, username: "spiderman", profileImageUrl: "spiderman", fullName: "Peter Parker", bio: "Test bio", email: "spiderman@hotmail.com")
    ]
}
