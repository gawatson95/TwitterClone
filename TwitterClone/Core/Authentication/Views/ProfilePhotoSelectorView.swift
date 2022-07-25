//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/26/22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker: Bool = false
    @State var image: UIImage?
    @State var profileImage: Image?

    @EnvironmentObject var vm: AuthVM
    
    var body: some View {
        VStack {
            HeaderView(title1: "Next step.", title2: "Let's get personal.")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                } else {
                    VStack {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                        Text("Add profile photo")
                            .font(.headline)
                    }
                }
            }
            .padding(.top, 44)
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $image)
            }
            
            if let image = image {
                Spacer()
                
                Button {
                    vm.uploadProfileImage(image)
                } label: {
                    Text("Continue")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(Capsule())
                        .shadow(color: .gray.opacity(0.5), radius: 10)
                        .padding()
                        .padding(.bottom)
                }
            } else {
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let image = image else { return }
        profileImage = Image(uiImage: image)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
            .environmentObject(AuthVM())
    }
}
