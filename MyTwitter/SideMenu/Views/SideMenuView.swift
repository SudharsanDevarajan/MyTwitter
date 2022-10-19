//
//  SideMenuView.swift
//  MyTwitter
//
//  Created by htcuser on 26/07/22.
//

import SwiftUI
import Amplify

struct SideMenuView: View {
    
    @EnvironmentObject var profileViewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading,spacing: 32) {
            VStack(alignment: .leading){
                Circle()
                    .frame(width: 58, height: 58)
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Sudharsan")
                        .font(.headline)
                    
                    Text("@sdjn")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                UserStatsView()
                    .padding(.vertical)
            }
            
            ForEach(SideMenuViewModel.allCases,id: \.rawValue){ menu in
                if menu == .profile{
//                    let user = Amplify.Auth.getCurrentUser()
//                    NavigationLink(destination: ProfileView(user: user)) {
//                        
//                    }
                    SideMenuOptionView(viewModel: menu)
                }else if menu == .logout{
                    Button {
                        profileViewModel.SignOut()
                    } label: {
                        SideMenuOptionView(viewModel: menu)
                    }

                }else{
                    SideMenuOptionView(viewModel: menu)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal)
       
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}



