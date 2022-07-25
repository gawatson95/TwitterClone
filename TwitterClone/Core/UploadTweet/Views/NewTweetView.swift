//
//  NewTweetView.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/23/22.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authVm: AuthVM
    
    @ObservedObject var tweetVm = UploadTweetVM()
    
    @State private var caption: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }

                Spacer()
                Button {
                    tweetVm.uploadTweet(withCaption: caption)
                } label: {
                    Text("Tweet")
                        .foregroundColor(.white)
                        .font(.subheadline.bold())
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.blue)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                if let user = authVm.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                    .clipShape(Circle())
                }
                
                TextArea("What's happening?", text: $caption)
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal)
        }
        .onReceive(tweetVm.$didUploadTweet) { success in
            if success { dismiss() }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
