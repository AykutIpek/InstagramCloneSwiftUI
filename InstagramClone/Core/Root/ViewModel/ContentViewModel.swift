//
//  ContentViewModel.swift
//  InstagramClone
//
//  Created by aykut ipek on 20.07.2023.
//

import Foundation
import Firebase
import Combine


final class ContentViewModel: ObservableObject {
    //MARK: - Properties
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    @Published var userSession: FirebaseAuth.User?
    
    init(){
        setupSubscribers()
    }
}

//MARK: - Functions
extension ContentViewModel{
    func setupSubscribers(){
        service.$userSession.sink {[weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
