//
//  TabView.swift
//  MyTwitter
//
//  Created by htcuser on 26/07/22.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView {
            FeedView()
                .onTapGesture {
                    self.selectedTab = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            
            ExploreView()
                .onTapGesture {
                    self.selectedTab = 0
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            NotificationView()
                .onTapGesture {
                    self.selectedTab = 0
                }
                .tabItem {
                    Image(systemName: "bell")
                }
                .tag(2)
            
            MessagesView()
                .onTapGesture {
                    self.selectedTab = 0
                }
                .tabItem {
                    Image(systemName: "envelope")
                }
                .tag(3)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
