//
//  MainTabView.swift
//  InstagramClone
//
//  Created by aykut ipek on 9.07.2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .tint(Color.primary)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
