//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by aykut ipek on 18.07.2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    var posts: [Post]{
        return Post.MOCK_POSTS.filter({ $0.user?.fullName == user.username})
    }
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // Header
                ProfileHeaderView(user: user)
                // Post Grid View
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }

                }
            }
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[0])
    }
}
