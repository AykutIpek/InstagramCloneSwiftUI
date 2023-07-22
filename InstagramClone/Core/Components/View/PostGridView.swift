//
//  PostGridView.swift
//  InstagramClone
//
//  Created by aykut ipek on 18.07.2023.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    //MARK: - Properties
    @StateObject var viewModel: PostGridViewModel
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    //MARK: - LifeCycle
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }

    //MARK: - Body
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(user: User.MOCK_USERS[0])
    }
}
