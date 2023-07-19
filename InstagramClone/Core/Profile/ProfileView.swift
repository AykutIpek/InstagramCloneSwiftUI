//
//  ProfileView.swift
//  InstagramClone
//
//  Created by aykut ipek on 9.07.2023.
//

import SwiftUI

struct ProfileView: View {
    //MARK: - Properties
    var posts: [Post]{
        return Post.MOCK_POSTS.filter({ $0.user?.fullName == user.fullName})
    }
    let user: User
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    //MARK: - Body
    var body: some View {
        ScrollView {
            // Header
            ProfileHeaderView(user: user)
            // Post Grid View
            PostGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}
