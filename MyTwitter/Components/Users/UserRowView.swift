//
//  UserView.swift
//  MyTwitter
//
//  Created by htcuser on 26/07/22.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    
    @State var user: Users
    
    var body: some View {
        HStack(spacing: 12){
            KFImage(URL(string: user.profileImageurl))
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
            
            VStack(alignment: .leading,spacing: 4){
                Text(user.fullname)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("@\(user.username)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical,4)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: Users(email: "", fullname: "", username: "", profileImageurl: ""))
    }
}
