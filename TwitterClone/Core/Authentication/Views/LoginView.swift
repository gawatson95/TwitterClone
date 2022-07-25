//
//  LoginView.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/23/22.
//

import SwiftUI

struct LoginView: View {
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @EnvironmentObject var vm: AuthVM
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title1: "Hello.", title2: "Welcome Back!")
                
            Spacer()
            
            VStack(spacing: 30) {
                CustomInputField(imageName: "envelope", placeholder: "Email", text: $emailText)
                
                CustomInputField(imageName: "lock", placeholder: "Password", isSecureField: true, text: $passwordText)
                
                NavigationLink {
                    // Reset password view
                } label: {
                    Text("Forgot Password?")
                        .font(.subheadline.bold())
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    vm.loginWithEmail(withEmail: emailText, password: passwordText)
                } label: {
                    Text("Sign In")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(Capsule())
                        .shadow(color: .gray.opacity(0.5), radius: 10)
                }
                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                } label: {
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                        Text("Sign Up")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
