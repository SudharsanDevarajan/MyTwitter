//
//  ConfirmCodeView.swift
//  MyTwitter
//
//  Created by htcuser on 29/07/22.
//

import SwiftUI

struct ConfirmCodeView: View {
    
    @State private var otp = ""
    @Environment(\.presentationMode)  var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Enter OTP",
                           title2: "Confirm Account")
            
            
            CustomTextField(imageName: "lock",
                            placeHolderText: "Enter 6 Digit OTP",
                            text: $otp)
                .padding(.top,42)
                .padding()
            
            Button {
                viewModel.confirmCode(with: otp)
            } label: {
                Text("Sign Up")
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
//        .toolbar(.hidden)
        .ignoresSafeArea()
    }
}

struct ConfirmCodeView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmCodeView()
    }
}
