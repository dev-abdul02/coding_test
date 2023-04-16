//
//  CustomAvatar.swift
//  coding_project
//
//  Created by abdul karim on 15/04/23.
//

import SwiftUI
import PhotosUI

struct CustomAvatar: View {
    
    @State var showImageSelectionOption:Bool = false
    @State var showImagePicker: Bool = false
    @State var openCamera:Bool = false
    @State var selectedImage: UIImage?
    var callback: (UIImage) -> Void
    
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                if selectedImage != nil {
                    Image(uiImage: selectedImage ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 200)
                        .cornerRadius(10)
                }else {
                    Rectangle()
                        .frame(width: 150, height: 200)
                        .cornerRadius(10)
                        .foregroundColor(.gray.opacity(0.3))
                        .onTapGesture {
                            self.showImageSelectionOption.toggle()
                        }
                    
                    Text(TAP_TO_ADD_AVATAR)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                }

            }

            .confirmationDialog("Select Option", isPresented: $showImageSelectionOption, titleVisibility: .visible) {
                Button("Photo Library") {
                    self.showImagePicker.toggle()
                }
                Button("Camera") {
                    self.openCamera.toggle()
                }
            }
            .sheet(isPresented: $showImagePicker) {
                if showImagePicker {
                    ImagePickerView(sourceType: .photoLibrary) { image in
                        self.selectedImage = image
                        self.callback(image)
                    }
                }else {
                    ImagePickerView(sourceType: .camera) { image in
                        self.selectedImage = image
                        self.callback(image)
                    }
                }

            }
            Spacer()
        }

    }
}

//struct CustomAvatar_Previews: PreviewProvider {
//    static var previews: some View {
//       // CustomAvatar(, callback: (UIImage) -> Void)
//    }
//}
