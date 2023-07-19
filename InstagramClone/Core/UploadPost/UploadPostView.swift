//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by aykut ipek on 19.07.2023.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption: String = ""
    var body: some View {
        VStack{
            HStack{
                Button {
                    print("Cancel Button")
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    print("Upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding()
            
            HStack(spacing: 8){
                Image("Me")
                    .resizable()
                    .frame(width: 100, height: 100)
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding()
            Spacer()
        }
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
