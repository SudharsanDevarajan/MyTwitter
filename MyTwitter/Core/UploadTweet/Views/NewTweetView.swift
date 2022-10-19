//
//  NewTweetView.swift
//  MyTwitter
//
//  Created by htcuser on 26/07/22.
//

import SwiftUI

struct NewTweetView: View {
    
    @State var tweetText: String = ""
    @Environment(\.presentationMode) var tweetView
    @ObservedObject var tweetVM = TweetViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    tweetView.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    // todo
                    tweetVM.addTweet(caption: tweetText)
                    
                } label: {
                    Text("Tweet")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical,8)
                        .padding(.horizontal)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                }

            }
            
            
            HStack(){
                Circle()
                    .frame(width: 52, height: 52 )
                
                TextField("What's happening",text: $tweetText)
//                    .lineLimit(...10)
//                    .scrollIndicators(.visible)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .onReceive(tweetVM.$didTweetSaved, perform: { success in
            if success{
                tweetView.wrappedValue.dismiss()
            }
        })
        .padding()
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
