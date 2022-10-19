//
//  HomeView.swift
//  MyTwitter
//
//  Created by htcuser on 26/07/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            // if already loggin
            if viewModel.isLoggin{
                mainInterface
            }else{
                LoginView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


extension HomeView{
    var mainInterface: some View{
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu{
                ZStack{
                    Color.black.opacity(0.25)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .background(.white)
                .offset(x: showMenu ? 0 : -300, y: 0)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.easeInOut) {
                        showMenu.toggle()
                    }
                } label: {
                    Circle()
                        .frame(width: 32, height: 32)
                }
            }
        }
        .onAppear{
            showMenu = false
        }
    }
}
