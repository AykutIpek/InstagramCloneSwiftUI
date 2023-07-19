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
    
    var body: some View {
        VStack(spacing: 10) {
            
            // Picture and Stats
            HStack{
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
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
                //
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundColor(Color.primary)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
            }
            
            Divider()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
