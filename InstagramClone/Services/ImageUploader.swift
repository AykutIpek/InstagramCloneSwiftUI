//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by aykut ipek on 22.07.2023.
//

import Foundation
import Firebase
import FirebaseStorage

protocol IImageUploader {
    static func uploadImage(image: UIImage) async throws -> String?
}


struct ImageUploader: IImageUploader {
    static func uploadImage(image: UIImage) async throws -> String?{
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil}
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images\(fileName)")
        
        do {
            let _ =  try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
            return nil
        }
    }
}
