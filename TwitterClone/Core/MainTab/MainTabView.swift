//
//  MainTabView.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/23/22.
//

import SwiftUI

struct MainTabView: View {
    @State private var selected: Int = 0
    
    var body: some View {
        TabView(selection: $selected) {
            FeedView()
                .onTapGesture {
                    self.selected = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            ExploreView()
                .onTapGesture {
                    self.selected = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            NotificationsView()
                .onTapGesture {
                    self.selected = 2
                }
                .tabItem {
                    Image(systemName: "bell")
                }.tag(2)
            
            MessagesView()
                .onTapGesture {
                    self.selected = 3
                }
                .tabItem {
                    Image(systemName: "envelope")
                }.tag(3)
            
//            ProfileView()
//                .onTapGesture {
//                    self.selected = 4
//                }
//                .tabItem {
//                    Image(systemName: "person.fill")
//                }.tag(4)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
