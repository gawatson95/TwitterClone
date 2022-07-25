//
//  UserRowView.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/23/22.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 48, height: 48)
            VStack(alignment: .leading) {
                Text(user.fullname)
                    .foregroundColor(.black)
                    .font(.subheadline.bold())
                Text("@\(user.username)")
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: User(id: "1234", username: "ladygaga", fullname: "Lady Gaga", profileImageUrl: "", email: ""))
    }
}
