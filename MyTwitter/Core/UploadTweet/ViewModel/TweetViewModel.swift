//
//  TweetViewModel.swift
//  MyTwitter
//
//  Created by htcuser on 29/07/22.
//

import SwiftUI
import Amplify


class TweetViewModel: ObservableObject{
    
    @Published var didTweetSaved = false
    @Published var tweets = [Tweets]()
    
    func addTweet(caption: String){
        
        guard let user = Amplify.Auth.getCurrentUser() else { return }
        
        let tweet = Tweets(userId: user.userId,
                           caption: caption,
                           likes: 0,
                           timeStamp: Temporal.DateTime(Date()))
        
        Amplify.DataStore.save(tweet) { result in
            switch result{
            case .success(let createdTweet):
                print("Tweet saved \(createdTweet.id)")
                self.didTweetSaved = true
            case .failure(let error):
                print("Tweet not created \(error)")
            }
        }
    }
    
    func fetchTweets(){
        Amplify.DataStore.query(Tweets.self) { results in
            do{
                let fetchedTweets =  try results.get()
                DispatchQueue.main.async {
                    self.tweets = fetchedTweets.reversed()
                }
                print("Total tweets \(fetchedTweets)")
            }catch{
                print("fetching tweets error")
            }
        }
    }
}
