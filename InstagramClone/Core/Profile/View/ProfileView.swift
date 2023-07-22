//
//  ProfileView.swift
//  InstagramClone
//
//  Created by aykut ipek on 9.07.2023.
//

import SwiftUI

struct ProfileView: View {
    //MARK: - Properties
    let user: User
    
    //MARK: - Body
    var body: some View {
        ScrollView {
            // Header
            ProfileHeaderView(user: user)
            // Post Grid View
            PostGridView(user: user)
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
