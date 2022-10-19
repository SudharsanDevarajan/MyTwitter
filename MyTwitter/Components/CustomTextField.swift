//
//  CustomTextField.swift
//  MyTwitter
//
//  Created by htcuser on 28/07/22.
//

import SwiftUI

struct CustomTextField: View {
    var imageName: String
    var placeHolderText: String
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.secondary)
                
                TextField(placeHolderText, text: $text)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
            }
            
            Divider()
                .foregroundColor(.secondary)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(imageName: "envelope",
                        placeHolderText: "Email",
                        text: .constant(""))
    }
}
