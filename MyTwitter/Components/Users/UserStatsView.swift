//
//  UserStatsView.swift
//  MyTwitter
//
//  Created by htcuser on 26/07/22.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24){
            HStack{
                Text("64")
                    .bold()
                    .font(.subheadline)
                
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack{
                Text("107")
                    .bold()
                    .font(.subheadline)
                
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
