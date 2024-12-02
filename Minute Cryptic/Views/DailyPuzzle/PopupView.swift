//
//  PopupView.swift
//  Minute Cryptic
//
//  Created by David Freeman on 11/30/24.
//

import SwiftUI

struct PopupView: View {
    @Binding var isPresented: Bool
    @Binding var title: String
    @Binding var message: String
    @Binding var backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(backgroundColor)
                .stroke(.black, lineWidth: 5)
            VStack {
                HStack {
                    Text(title)
                        .font(.custom("mulish", size: 30))
                        .bold()
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    VStack {
                        Button(action: { isPresented = false }, label: {
                            Image(systemName: "xmark")
                                .font(.custom("mulish", size: 25))
                                .bold()
                                .tint(.black)
                        })
                        Spacer()
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                Text(message)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.custom("mulish", size: 20))
                    .foregroundStyle(.black)
                
                Spacer()
            }
            .padding(.vertical, 20)
        }
        .frame(height: 100)
        .padding(20)
    }
}

#Preview {
    struct PopupView_Preview: View {
        @State var isPresented: Bool = false
        @State var title: String = "Keep Trying!"
        @State var message: String = "You can show a letter for some help!"
        @State var backgroundColor: Color = Color("mcYellow")
        
        var body: some View {
            PopupView(
                isPresented: $isPresented,
                title: $title,
                message: $message,
                backgroundColor: $backgroundColor
            )
        }
    }
    
    return PopupView_Preview()
}
