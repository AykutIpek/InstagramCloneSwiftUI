//
//  RegisterationViewModel.swift
//  InstagramClone
//
//  Created by aykut ipek on 20.07.2023.
//

import Foundation


final class RegisterationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        username = ""
        email = ""
        password = ""
    }
}
