//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by aykut ipek on 19.07.2023.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
final class UploadPostViewModel: ObservableObject{
    //MARK: - Properties
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task {await loadImage(fromItem: selectedImage)} }
    }
    @Published var postImage: Image?

}

//MARK: - Functions
extension UploadPostViewModel{
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        
        guard let uiImage = UIImage(data: data) else { return }
        
        self.postImage = Image(uiImage: uiImage)
    }
}
