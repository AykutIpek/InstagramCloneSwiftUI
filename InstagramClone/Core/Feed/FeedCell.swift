//
//  FeedCell.swift
//  InstagramClone
//
//  Created by aykut ipek on 10.07.2023.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            // Image + Username
            HStack {
                Image("Astronout")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text("astronout")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
            }.padding(.leading, 8)
            
            // Post Image
            
            Image("Astronout")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // Action Buttons
            HStack(spacing: 16){
                Button {
                    print("Like Post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Button {
                    print("Comment On Post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                Button {
                    print("Share Post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.primary)
            
            
            // Likes Label
            Text("23 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            // Caption Label
            HStack{
                Text("Astronout ").fontWeight(.semibold) +
                Text("This is some test caption now this is some caption dsadsadsadsadsadsadasdasda")
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
            .padding(.top, 1)
            
            Text("6h ego")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
