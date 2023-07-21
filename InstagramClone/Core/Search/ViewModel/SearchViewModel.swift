//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by aykut ipek on 21.07.2023.
//

import Foundation

protocol ISearchViewModel {
    func fetchAllUsers() async throws
}


final class SearchViewModel: ObservableObject {
    //MARK: - Properties
    @Published var users = [User]()
    
    //MARK: - LifeCycle
    init(){
        Task { try await fetchAllUsers() }
    }
}


//MARK: - Functions
extension SearchViewModel: ISearchViewModel {
    @MainActor
    func fetchAllUsers() async throws{
        self.users = try await UserService.fetchAllUsers()
    }
    
}
