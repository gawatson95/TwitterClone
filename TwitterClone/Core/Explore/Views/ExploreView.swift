//
//  ExploreView.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/23/22.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var vm = ExploreVM()
    
    var body: some View {
        VStack {
            SearchBar(text: $vm.searchText)
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(vm.searchableUsers) { user in
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                        
                        Divider()
                            .padding(.horizontal)
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
