//
//  ProfileView.swift
//  InstagramClone
//
//  Created by aykut ipek on 9.07.2023.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        ScrollView {
            // Header
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
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
                }
                
                Divider()
            }
            // Post Grid View
            LazyVGrid(columns: gridItems, spacing: 1) {
                ForEach(0...15, id: \.self) { index in
                    Image("MeResized")
                        .resizable()
                        .scaledToFill()
                }
            }
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
