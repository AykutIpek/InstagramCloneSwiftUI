//
//  SearchView.swift
//  InstagramClone
//
//  Created by aykut ipek on 10.07.2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12){
                    ForEach(User.MOCK_USERS) { user in
                        NavigationLink(value: user, label: {
                            HStack{
                                Image(user.profileImageUrl ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading){
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    if let fullName = user.fullName {
                                        Text(fullName)
                                    }
                                }
                                .font(.footnote)
                                Spacer()
                            }
                            .foregroundColor(Color.primary)
                        })
                        .padding(.horizontal)
                    }
                }
                .searchable(text: $searchText, prompt: "Search...")
            }
            .padding(.top, 8)
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
