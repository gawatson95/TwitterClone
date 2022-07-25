//
//  SideMenuOptionRowView.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/23/22.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let vm: SideMenuVM
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: vm.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(vm.title)
                .font(.subheadline)
                .foregroundColor(.black)
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(vm: .profile)
    }
}
