//
//  HeaderView.swift
//  TwitterClone
//
//  Created by Grant Watson on 6/23/22.
//

import SwiftUI

struct HeaderView: View {
    let title1: String
    let title2: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title1)
            Text(title2)
                .font(.largeTitle.bold())
                .foregroundColor(.white)
        }
        .padding(.leading)
        .font(.largeTitle.bold())
        .foregroundColor(.white)
        .frame(height: 240)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.blue)
        .clipShape(RoundedShape(corners: .bottomRight))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title1: "Hello.", title2: "Welcome back!")
    }
}
