//
//  ActionButtonsView.swift
//  Minute Cryptic
//
//  Created by David Freeman on 11/29/24.
//

import SwiftUI

struct ActionButtonsView: View {
    @Binding var enableCheck: Bool
    var checkAnswer: () -> Void
    var showHint: () -> Void
    var revealLetter: () -> Void
    
    var body: some View {
        HStack {
            Button(action: { self.showHint() }, label: {
                ZStack {
                    Capsule()
                        .stroke(.black, lineWidth: 5)
                        .fill(.white)
                        .frame(width: 115, height: 45)
                    Text("show hint")
                        .font(.custom("sansita", size: 18))
                        .tint(.black)
                        .bold()
                }
            })
            Button(action: { self.revealLetter() }, label: {
                ZStack {
                    Capsule()
                        .stroke(.black, lineWidth: 5)
                        .fill(.mcYellow)
                        .frame(width: 115, height: 45)
                    Text("show letter")
                        .font(.custom("sansita", size: 18))
                        .tint(.black)
                        .bold()
                }
            })
            Button(action: { self.checkAnswer() }, label: {
                ZStack {
                    Capsule()
                        .stroke(.black, lineWidth: 5)
                        .fill(.mcPurple)
                        .frame(width: 115, height: 45)
                    Text("check it")
                        .font(.custom("sansita", size: 18))
                        .tint(.black)
                        .bold()
                }
            })
            .disabled(!enableCheck)
        }
    }
}

#Preview {
    struct ActionButtonsView_Preview: View {
        @State var enableCheck: Bool = false
        
        var body: some View {
            ActionButtonsView(
                enableCheck: $enableCheck,
                checkAnswer: {},
                showHint: {},
                revealLetter: {})
        }
    }
    
    return ActionButtonsView_Preview()
}
