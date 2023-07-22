//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by aykut ipek on 21.07.2023.
//

import PhotosUI
import Firebase
import SwiftUI

enum UpdateUserDataEnum: String {
    case profileImageUrl = "profileImageUrl"
    case fullName = "fullName"
    case bio = "bio"
}

@MainActor
final class EditProfileViewModel: ObservableObject {
    //MARK: - Properties
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task {await loadImage(fromItem: selectedImage)} }
    }
    @Published var profileImage: Image?
    @Published var fullName = ""
    @Published var bio = ""
    private var uiImage: UIImage?
    
    //MARK: - Life Cycle
    init(user: User) {
        self.user = user
    }
}

//MARK: - Functions
extension EditProfileViewModel{
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        // Update profile image if changed
        var data = [String: Any]()
        
        if let uiImage = uiImage{
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data[UpdateUserDataEnum.profileImageUrl.rawValue] = imageUrl
        }
        
        // update name if changed
        if !fullName.isEmpty && user.fullName != fullName {
            data[UpdateUserDataEnum.fullName.rawValue] = fullName
        }
        // Update bio if changed
        if !bio.isEmpty && user.bio != bio {
            data[UpdateUserDataEnum.bio.rawValue] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
