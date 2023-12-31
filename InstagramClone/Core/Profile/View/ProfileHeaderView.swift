//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by aykut ipek on 19.07.2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    //MARK: - Properties
    let user: User
    @State private var showEditProfile = false
    
    var body: some View {
        VStack(spacing: 10) {
            
            // Picture and Stats
            HStack{
                CirclerProfileImageView(user: user, size: .large)
                Spacer()
                HStack(spacing: 8) {
                    UserStatView(value: 12, title: "Posts")
                    UserStatView(value: 576, title: "Followers")
                    UserStatView(value: 552, title: "Following")
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 4)
            
            // Name and Bio
            VStack(alignment: .leading, spacing: 4) {
                if let fullname = user.fullName{
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // Action Button
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                }else{
                    print("Follow user...")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? Color.clear : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? Color.primary : .white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                    )
            }
            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
