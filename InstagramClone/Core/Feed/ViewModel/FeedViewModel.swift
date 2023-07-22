//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by aykut ipek on 22.07.2023.
//

import SwiftUI
import Firebase

final class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPost() }
    }
    
    @MainActor
    func fetchPost() async throws {
        self.posts = try await PostService.fetchFeedPosts() 
    }
}
