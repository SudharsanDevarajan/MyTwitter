//
//  ExploreView.swift
//  MyTwitter
//
//  Created by htcuser on 26/07/22.
//

import SwiftUI


struct ExploreView: View {
    
    @ObservedObject var exploreVM = ExploreViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    LazyVStack{
                        ForEach(exploreVM.users) { user in
                            NavigationLink {
                                ProfileView(user: user)
                            } label: {
                                UserRowView(user: user)
                            }
                        }
                    }
                }
            }
            .onAppear{
                exploreVM.fetchUsers()
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
