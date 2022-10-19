//
//  ProfileView.swift
//  MyTwitter
//
//  Created by htcuser on 26/07/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @State var user: Users
    @StateObject var tweetVM = TweetViewModel()
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var filterAnimation
    
    var body: some View {
        VStack(alignment: .leading){
            headerView
            actionButtons
            userInfoDetails
            tweetFilterBar
            tweetsView
        }
        .navigationTitle("Profile")
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: Users(email: "", fullname: "", username: "", profileImageurl: ""))
    }
}


extension ProfileView{
    var headerView: some View{
        ZStack(alignment: .bottomLeading){
            Color.blue
                .ignoresSafeArea()
            VStack{
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                }

                KFImage(URL(string: user.profileImageurl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 72, height: 72)
                    .clipShape(Circle())
                    .offset(x: 16, y: 28)
            }
            
        }
        .frame(height: 88)
    }
    
    var actionButtons: some View{
        HStack(spacing: 12){
            
            Spacer()
            
            Button {
                // button action
            } label: {
                Image(systemName: "bell.badge")
                    .font(.title2)
                    .padding(6)
                    .foregroundColor(.black)
                    .overlay(Circle().stroke(Color.gray, lineWidth : 0.50))
            }
            
            Button {
                // button action
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.50))
            }

        }
        .padding(.trailing)
    }
    
    var userInfoDetails: some View{
        VStack(alignment: .leading,spacing: 4){
            HStack{
                Text(user.fullname)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
            }
            
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            
            Text("Your mom's favourite villan")
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .padding(.vertical)
            
            HStack(spacing: 24){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Rail Nagar")
                }
                
                HStack{
                    Image(systemName: "link")
                    
                    Text("www.lin.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatsView()
                .padding(.vertical)
            
            
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View{
        HStack{
            ForEach(TweetFilterViewModel.allCases,id: \.rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item{
                        Capsule()
                            .foregroundColor(Color.blue)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "sampleName", in: filterAnimation)
                    }else{
                        Capsule()
                            .foregroundColor(Color.clear)
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0,y: 16))
    }
    
    
    var tweetsView: some  View{
        ScrollView{
            LazyVStack{
                ForEach(tweetVM.tweets) { tweet in
                    TweetView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
}
