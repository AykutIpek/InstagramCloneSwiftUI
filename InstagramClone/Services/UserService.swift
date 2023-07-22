//
//  UserService.swift
//  InstagramClone
//
//  Created by aykut ipek on 21.07.2023.
//

import Foundation
import Firebase

protocol IUserService {
    static func fetchAllUsers() async throws -> [User]
    static func fetchUser(withUid uid: String) async throws -> User
}


struct UserService: IUserService {
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self )})
    }
}
