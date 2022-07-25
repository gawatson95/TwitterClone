//
//  TweetRowVM.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/28/22.
//

import Foundation

class TweetRowVM: ObservableObject {
    @Published var tweet: Tweet
    private let service = TweetService()
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfLiked()
    }
    
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    func checkIfLiked() {
        service.checkIfLiked(tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
    
    func unlikeTweet() {
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
}
