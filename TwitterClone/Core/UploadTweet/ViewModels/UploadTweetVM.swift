//
//  UploadTweetVM.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/28/22.
//

import Foundation

class UploadTweetVM: ObservableObject {
    @Published var didUploadTweet: Bool = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            } else {
                // show alert to user
            }
        }
    }
}
