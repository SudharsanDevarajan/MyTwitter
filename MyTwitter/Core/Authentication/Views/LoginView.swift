//
//  LoginView.swift
//  MyTwitter
//
//  Created by htcuser on 28/07/22.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 4){
            
            AuthHeaderView(title1: "Hello,",
                           title2: "Welcome Back")
            
            // user input view
            VStack(spacing: 40){
                CustomTextField(imageName: "envelope",
                                placeHolderText: "Email",
                                text: $viewModel.email)
                
                CustomTextField(imageName: "lock",
                                placeHolderText: "Password",
                                text: $viewModel.password)
            }
            .padding(.top,44)
            .padding(.horizontal)
            
            
            HStack{
                Spacer()
                
                NavigationLink {
                    SignUpView()
                } label: {
                    Text("Forget password?")
                        .font(.caption)
                        .foregroundColor(.blue)
                        .padding(.top)
                        .padding(.trailing,24)
                }

            }
            
            Button {
                viewModel.login()
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .frame(width: 300, height: 42)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
                    
            }
            .shadow(color: .gray.opacity(0.3), radius: 10,x: 0,y: 0)

            
            Spacer()
            
            
            NavigationLink {
                SignUpView()
                    .navigationBarHidden(true)
            } label: {
                HStack{
                    Text("New user?")
                        .font(.footnote)
                        .foregroundColor(.blue)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom,42)

        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



