//
//  HeaderView.swift
//  Minute Cryptic
//
//  Created by David Freeman on 11/29/24.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var showHelpSheet: Bool
    
    var body: some View {
        HStack {
            Button(action: { presentationMode.wrappedValue.dismiss() }) {
                Image(systemName: "arrow.left")
                    .font(.title)
                    .tint(.primary)
                    .bold()
            }
            .padding(.leading, 20)
            
            Button(action: { showHelpSheet.toggle() }) {
                Image(systemName: "questionmark.app.fill")
                    .foregroundStyle(.mcYellow)
                    .background(.black)
                    .bold()
                    .font(.title)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            
            Spacer()
            
            VStack(spacing: 0) {
                Text(" Minute")
                    .font(.custom("mulish", size: 20))
                    .bold()
                Text("Cryptic")
                    .font(.custom("mulish", size: 20))
                    .bold()
            }
            Image("logo")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.trailing, 20)
        }
        .frame(height: 100)
        .background(.background)
    }
}

#Preview {
    struct HeaderView_Preview: View {
        @State var showHelpSheet: Bool = false
        
        var body: some View {
            HeaderView(showHelpSheet: $showHelpSheet)
        }
    }
    
    return HeaderView_Preview()
}
