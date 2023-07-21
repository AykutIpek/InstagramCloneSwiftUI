//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by aykut ipek on 21.07.2023.
//

import PhotosUI
import Firebase
import SwiftUI

@MainActor
final class EditProfileViewModel: ObservableObject {
    //MARK: - Properties
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task {await loadImage(fromItem: selectedImage)} }
    }
    @Published var profileImage: Image?
    @Published var fullName = ""
    @Published var bio = ""
    

}

//MARK: - Functions
extension EditProfileViewModel{
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        
        guard let uiImage = UIImage(data: data) else { return }
        
        self.profileImage = Image(uiImage: uiImage)
    }
}
