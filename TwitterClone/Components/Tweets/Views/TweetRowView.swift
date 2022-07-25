//
//  TweetRowView.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/22/22.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    @ObservedObject var vm: TweetRowVM
    
    init(tweet: Tweet) {
        self.vm = TweetRowVM(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = vm.tweet.user {
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 5) {
                            Text(user.fullname)
                                .font(.subheadline.bold())
                            
                            Text("@\(user.username)")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Text("• 49w")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Text(vm.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
                .frame(alignment: .leading)
            }
            
            HStack {
                Button {
                    // comment
                } label: {
                    Image(systemName: "bubble.left")
                }
                
                Spacer()
                
                Button {
                    // retweet
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                }
                
                Spacer()
                
                Button {
                    vm.tweet.didLike ?? false ? vm.unlikeTweet() : vm.likeTweet()
                } label: {
                    Image(systemName: vm.tweet.didLike ?? false ? "heart.fill" : "heart")
                        .foregroundColor(vm.tweet.didLike ?? false ? .red : .gray )
                }
                
                Spacer()
                
                Button {
                    // bookmark
                } label: {
                    Image(systemName: "bookmark")
                }
            }
            .padding()
            .foregroundColor(.gray)
            .font(.subheadline)
            .frame(alignment: .leading)
            
            Divider()
        }
        .padding([.leading, .trailing, .bottom])
        .padding(.top, 5)
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView(tweet: Tweet(caption: "", timestamp: Date.now, uid: "", likes: 2))
//    }
//}
