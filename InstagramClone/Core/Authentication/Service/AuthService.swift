//
//  AuthService.swift
//  InstagramClone
//
//  Created by aykut ipek on 20.07.2023.
//

import Foundation
import FirebaseAuth

protocol IAuthService{
    func login(withEmail email: String, password: String) async throws
    func createUser(email: String, password: String, username: String) async throws
    func loadUserData() async throws
    func signOut()
}

final class AuthService{
    //MARK: - Properties
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    //MARK: - LifeCycle
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
}

//MARK: - Functions
extension AuthService: IAuthService{
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut(){
        
    }
}