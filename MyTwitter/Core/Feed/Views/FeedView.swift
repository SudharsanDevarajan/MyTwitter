//
//  FeedView.swift
//  MyTwitter
//
//  Created by htcuser on 26/07/22.
//

import SwiftUI

struct FeedView: View {
    @StateObject var tweetVM = TweetViewModel()
    @State private var showNewTweet = false
    var body: some View {
        
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(tweetVM.tweets) { tweet in
                        TweetView(tweet: tweet)
                            .padding()
                    }
                }
            }.onAppear(perform: tweetVM.fetchTweets)
            
            Button {
                showNewTweet = true
            } label: {
                Image("newTweet")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 62,height: 62)
                    .clipShape(Circle())
            }
            .background(Color(.systemBlue))
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweet) {
                NewTweetView()
            }
        }
        .navigationViewStyle(.automatic)
      
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
