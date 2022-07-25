//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/23/22.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: AuthVM
    
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var usernameText: String = ""
    @State private var fullNameText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderView(title1: "Get started", title2: "Create your account")
            
            NavigationLink(destination: ProfilePhotoSelectorView(), isActive: $vm.didAuthenticateUser) { }
            
            VStack(spacing: 30) {
                CustomInputField(imageName: "person", placeholder: "Full Name", text: $fullNameText)
                
                CustomInputField(imageName: "at", placeholder: "Username", text: $usernameText)
                
                CustomInputField(imageName: "envelope", placeholder: "Email", text: $emailText)
                
                CustomInputField(imageName: "lock", placeholder: "Password", isSecureField: true, text: $passwordText)
                
                Button {
                    vm.register(withEmail: emailText, password: passwordText, fullname: fullNameText, username: usernameText)
                } label: {
                    Text("Sign Up")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(Capsule())
                        .shadow(color: .gray.opacity(0.5), radius: 10)
                }
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                        Text("Sign In")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundColor(.blue)
                }
                .padding(.bottom)
            }
            .padding()
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(AuthVM())
    }
}
