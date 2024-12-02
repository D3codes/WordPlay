//
//  HomeHeaderView.swift
//  Minute Cryptic
//
//  Created by David Freeman on 11/29/24.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
                .font(.largeTitle)
                .padding(.leading, 15)
            
            Spacer()
            
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack {
                    Text("Minute Cryptic")
                        .font(.custom("mulish", size: 20))
                        .bold()
                }
            }
            
            Spacer()
            
            Button(action: {  }, label: {
                Image(systemName: "person.crop.circle")
                    .tint(.primary)
                    .font(.largeTitle)
                    .padding(.trailing, 15)
            })
        }
        .frame(height: 100)
    }
}

#Preview {
    HomeHeaderView()
}
