//
//  SideMenuOptionView.swift
//  MyTwitter
//
//  Created by htcuser on 26/07/22.
//

import SwiftUI

struct SideMenuOptionView: View {
    
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(viewModel.description)
                .font(.subheadline)
                .foregroundColor(.black)
                
            
            Spacer()
        }
        .frame(height: 40)
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewModel: .profile)
    }
}
