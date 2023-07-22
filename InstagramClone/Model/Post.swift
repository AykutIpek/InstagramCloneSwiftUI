//
//  Post.swift
//  InstagramClone
//
//  Created by aykut ipek on 18.07.2023.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timeStamp: Timestamp
    var user: User?
}

extension Post{
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "This is some caption for noe",
              likes: 123,
              imageUrl: "Me",
              timeStamp: Timestamp(),
              user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Wakanda Forever",
              likes: 321,
              imageUrl: "blackpanther",
              timeStamp: Timestamp(),
              user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Iron Man",
              likes: 367,
              imageUrl: "ironman",
              timeStamp: Timestamp(),
              user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Deadpool is hungry. Time to eat",
              likes: 139,
              imageUrl: "deadpool",
              timeStamp: Timestamp(),
              user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Derdine Derman Spiderman",
              likes: 985,
              imageUrl: "spiderman",
              timeStamp: Timestamp(),
              user: User.MOCK_USERS[4])
    ]
}
