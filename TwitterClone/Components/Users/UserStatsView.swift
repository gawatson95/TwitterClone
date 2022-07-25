//
//  UserStatsView.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/23/22.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 20) {
            HStack(spacing: 4) {
                Text("117.9K")
                    .font(.headline)
                    .bold()
                Text("Following")
                    .foregroundColor(.gray)
            }

            HStack(spacing: 4) {
                Text("84.7M")
                    .font(.headline)
                    .bold()
                Text("Followers")
                    .foregroundColor(.gray)
            }
        }
        .font(.caption)
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
