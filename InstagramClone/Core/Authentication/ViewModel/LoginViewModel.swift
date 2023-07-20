//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by aykut ipek on 20.07.2023.
//

import Foundation

final class LoginViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
