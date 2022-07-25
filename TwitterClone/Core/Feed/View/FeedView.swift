//
//  FeedView.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/22/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweet: Bool = false
    @ObservedObject var vm = FeedVM()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(vm.tweets) { tweet in
                        TweetRowView(tweet: tweet)
                    }
                }
            }
            
            Button {
                showNewTweet.toggle()
            } label: {
                ZStack {
                    Circle()
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                }
                .frame(width: 60, height: 60)
                .padding()
                .fullScreenCover(isPresented: $showNewTweet) {
                    NewTweetView()
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
