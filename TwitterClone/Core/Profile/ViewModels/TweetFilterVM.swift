//
//  TweetFilterVM.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/23/22.
//

import Foundation

enum TweetFilterVM: Int, CaseIterable {
    case tweets, replies, likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
