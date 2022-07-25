//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/23/22.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var vm: AuthVM
    
    var body: some View {
        if let user = vm.currentUser {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 1) {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 52, height: 52)
                            .clipShape(Circle())
                        Text(user.fullname)
                            .font(.headline)
                        Text("@\(user.username)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    UserStatsView()
                        .padding(.vertical)
                }
                .padding(.leading)
                
                ForEach(SideMenuVM.allCases, id: \.self) { viewModel in
                    if viewModel == .profile {
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            SideMenuOptionRowView(vm: viewModel)
                        }
                    } else if viewModel == .logout {
                        Button {
                            vm.signOut()
                        } label: {
                            SideMenuOptionRowView(vm: viewModel)
                        }

                    } else {
                        SideMenuOptionRowView(vm: viewModel)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
            .environmentObject(AuthVM())
    }
}
