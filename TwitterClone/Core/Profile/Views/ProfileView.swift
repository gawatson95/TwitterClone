//
//  ProfileView.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/23/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: ProfileVM
    @State private var selectedFilter: TweetFilterVM = .tweets
    @Namespace var animation
    
    init(user: User) {
        self.vm = ProfileVM(user: user)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            actionButtons
            bioView
            tweetFilterBar
            tweetsView
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: "1234", username: "ladygaga", fullname: "Lady Gaga", profileImageUrl: "", email: "ladygaga@gmail.com"))
    }
}

extension ProfileView {
    
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Image("profile-header")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        ZStack {
                            Circle()
                                .fill(.black.opacity(0.5))
                                .frame(width: 30, height: 30)
                            Image(systemName: "arrow.left")
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(.black.opacity(0.5))
                                .frame(width: 30, height: 30)
                            Image(systemName: "magnifyingglass")
                        }
                        ZStack {
                            Circle()
                                .fill(.black.opacity(0.5))
                                .frame(width: 30, height: 30)
                            Image(systemName: "ellipsis")
                        }
                    }
                }
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.top)
                
                HStack {
                    ZStack {
                        Circle()
                            .stroke(.white, lineWidth: 8)
                            .frame(width: 72, height: 72)
                        KFImage(URL(string: vm.user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 72, height: 72)
                            .clipShape(Circle())
                    }
                    .offset(x: 20)
                        
                    Spacer()
                }
                .foregroundColor(.black.opacity(0.8))
            }
        }
        .frame(height: 85)
    }
    
    var actionButtons: some View {
        HStack {
            Spacer()
            
            Button {
                // notifications
            } label: {
                ZStack {
                    Circle()
                        .stroke()
                        .frame(width: 30, height: 30)

                    Image(systemName: "bell.badge")
                }
            }

            Button {
                // edit profile
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke()
                        .frame(width: 120, height: 30)

                    Text(vm.actionButtonTitle)
                        .bold()
                }
            }
        }
        .padding(.trailing)
    }
    
    var bioView: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading) {
                HStack {
                    Text(vm.user.fullname)
                        .font(.title2.bold())
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.blue)
                }

                Text("@\(vm.user.username)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Text("""
THE CHROMATICA BALL ⚔️💓 | Hold My Hand ✈️ Out Now | HAUS LABS 💄 @hauslabs | Love For Sale 🎺 Out Now https://TonyGaga.lnk.to/LoveForSale
""")
            .multilineTextAlignment(.leading)
            .font(.subheadline)

            HStack {
                HStack {
                    Image(systemName: "link")
                    Text("ladygaga.lnk.to/HoldMyHand")
                }

                Spacer()

                HStack {
                    Image(systemName: "calendar")
                    Text("Joined March 2008")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatsView()
                .padding(.bottom, 5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterVM.allCases, id: \.self) { filter in
                VStack {
                    Text(filter.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        .foregroundColor(selectedFilter == filter ? .black : .gray)
                    if selectedFilter == filter {
                        Capsule()
                            .foregroundColor(.blue)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = filter
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(vm.tweets(forFilter: self.selectedFilter)) { tweet in
                    TweetRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
}

