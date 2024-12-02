//
//  WordView.swift
//  Minute Cryptic
//
//  Created by David Freeman on 11/29/24.
//

import SwiftUI

struct WordView: View {
    @Binding var dailyPuzzle: DailyPuzzle
    @State var wordLength: Int
    @FocusState.Binding var focusedLetter: Int?
    @State var previousWordsLength: Int
    
    var handleCharacterChange: (_ index: Int) -> Void
    
    func getBackgroundColor(index: Int) -> Color {
        if dailyPuzzle.answerPieces[index].revealed {
            return .mcYellow
        }
        
        if focusedLetter == index || dailyPuzzle.solved {
            return .mcPurple
        }
        
        return .white
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<wordLength) { j in
                let index = previousWordsLength + j
                TextField("", text: $dailyPuzzle.answerPieces[index].letter, onEditingChanged: { (editingChanged) in
                    if editingChanged {
                        dailyPuzzle.answerPieces[index].letter = dailyPuzzle.answerPieces[index].letter
                    }
                })
                    .accentColor(.clear)
                    .font(.custom("sansita", size: 30))
                    .autocapitalization(.none)
                    .keyboardType(.alphabet)
                    .autocorrectionDisabled(true)
                    .frame(width: 50, height: 50)
                    .background(getBackgroundColor(index: index))
                    .border(.primary, width: 3)
                    .multilineTextAlignment(.center)
                    .disabled(dailyPuzzle.solved || dailyPuzzle.answerPieces[index].revealed)
                    .focused($focusedLetter, equals: index)
                    .onChange(of: dailyPuzzle.answerPieces[index].letter, {
                        handleCharacterChange(index)
                    })
            }
        }
        .foregroundStyle(.black)
    }
    
    
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(0..<wordLength) { j in
//                let index = previousWordsLength + j
//                TextField("", text: $dailyPuzzle.answerPieces[index].letter)
//                    .accentColor(.clear)
//                    .font(.custom("sansita", size: 30))
//                    .autocapitalization(.none)
//                    .keyboardType(.alphabet)
//                    .autocorrectionDisabled(true)
//                    .frame(width: 50, height: 50)
//                    .background(getBackgroundColor(index: index))
//                    .border(.primary, width: 3)
//                    .multilineTextAlignment(.center)
//                    .disabled(dailyPuzzle.solved)
//                    .focused($focusedLetter, equals: index)
//                    .onChange(of: dailyPuzzle.answerPieces[index].letter, {
//                        handleCharacterChange(index)
//                    })
//            }
//        }
//    }
}

#Preview {
    struct WordView_Preview: View {
        @FocusState var focusedLetter: Int?
        @State var enableCheck: Bool = false
        @State var dailyPuzzle: DailyPuzzle =  DailyPuzzle(puzzle: DailyPuzzleApiResponse(
            letterRevealOrder: [0,3,2,1,4],
            hint: "The definition part of the clue is 'Passed out'",
            clue: [
                Clue(text: "Passed out", type: "definition"),
                Clue(text: "from", type: nil),
                Clue(text: "nitrogen leaking out of dental surgery", type: "wordplay")
            ],
            answer: "DEALT",
            config: [5],
            par: 2,
            explainerVideo: "https://youtu.be/_M7S2rRyCdE",
            date: "2024-11-28",
            thumbnail: "https://i.ytimg.com/vi/_M7S2rRyCdE/maxresdefault.jpg"
        ))
        
        var body: some View {
            WordView(
                dailyPuzzle: $dailyPuzzle,
                wordLength: 5,
                focusedLetter: $focusedLetter,
                previousWordsLength: 0,
                handleCharacterChange: {index in }
            )
        }
    }
    
    return WordView_Preview()
}
