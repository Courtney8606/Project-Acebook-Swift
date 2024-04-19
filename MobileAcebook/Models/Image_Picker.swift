//
//  Image_Picker.swift
//  MobileAcebook
//
//  Created by Rachel Turrell on 19/04/2024.
//

import Foundation
import PhotosUI
import SwiftUI

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var imageName: String

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No-op => Short for "No Operation", to indicate to devs that nothing should go here
        // This is needed to conform to the protocol for this struct
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
           
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage  // Update the image

                if let url = info[.imageURL] as? URL {
                    parent.imageName = url.lastPathComponent  // Update the file name
                }
             
            }

            picker.dismiss(animated: true)
        }
    }
}
