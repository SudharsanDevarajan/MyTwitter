//
//  SignUpView.swift
//  MyTwitter
//
//  Created by htcuser on 28/07/22.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var username = ""
    @State private var fullname = ""
    @State private var email = ""
    @State private var password = ""
    @Environment(\.presentationMode)  var presentationMode
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var isOTPSent = false
    
    var body: some View {
        VStack{

            NavigationLink(destination: ConfirmCodeView(),isActive: $viewModel.isOTPSent,label: {})
            
            // header view
           AuthHeaderView(title1: "Get started",
                          title2: "Create your account")
            
            // user input view
            VStack(spacing: 40){
                
                CustomTextField(imageName: "person",
                                placeHolderText: "Full Name",
                                text: $fullname)
                
                CustomTextField(imageName: "person",
                                placeHolderText: "Username",
                                text: $username)
                
                CustomTextField(imageName: "envelope",
                                placeHolderText: "Email",
                                text: $email)
                

                CustomTextField(imageName: "lock",
                                placeHolderText: "Password",
                                text: $password)
            }
            .padding(.horizontal)
            .padding(.vertical,32)
            
            Button {
                viewModel.addUser(fullname: fullname, username: username, email: email)
                viewModel.register(email: email, pwd: password)
            } label: {
                Text("Send OTP")
                    .font(.headline)
                    .frame(width: 300, height: 42)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
                    
            }
            .shadow(color: .gray.opacity(0.3), radius: 10,x: 0,y: 0)

            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have an account?")
                        .font(.footnote)
                        .foregroundColor(.blue)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom,32)

        }
        .ignoresSafeArea()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
