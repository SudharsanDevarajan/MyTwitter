//
//  TweetView.swift
//  MyTwitter
//
//  Created by htcuser on 26/07/22.
//

import SwiftUI
import Amplify

struct TweetView: View {
    
    
    @State var tweet: Tweets
    
    var body: some View {
        VStack(alignment: .leading){
            
            // user image + user info + tweet info
            HStack(alignment: .top,spacing: 12){
                
                // user image
                Circle()
                    .frame(width: 56, height: 56)
                
                // user info and tweet
                VStack(alignment: .leading,spacing: 4){
                    // user info
                    HStack{
                        Text("username")
                            .foregroundColor(.black)
                            .font(.subheadline).bold()
                        
                        Text("@username")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    // tweet info
                    Text(tweet.caption ?? "")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            // tweet option buttons
            HStack{
                Button {
                    print("bubble")
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    print("bubble")
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    print("bubble")
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    print("bubble")
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .foregroundColor(.gray)
            .padding(.horizontal)
            .padding(.vertical,6)
            
            Divider()
        }
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView(tweet: Tweets(userId: "",
                                caption: "", likes: 0,
                                timeStamp: Temporal.DateTime(Date())
                               )
        )
    }
}
