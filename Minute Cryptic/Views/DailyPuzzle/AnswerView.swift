//
//  AnswerView.swift
//  Minute Cryptic
//
//  Created by David Freeman on 11/29/24.
//

import SwiftUI

struct AnswerView: View {
    @Binding var dailyPuzzle: DailyPuzzle
    @FocusState.Binding var focusedLetter: Int?
    
    var handleCharacterChange: (_ index: Int) -> Void
    
    var body: some View {
        VStack {
            ForEach(0..<dailyPuzzle.wordsInAnswer) { i in
                WordView(
                    dailyPuzzle: $dailyPuzzle,
                    wordLength: dailyPuzzle.answerWordLengths[i],
                    focusedLetter: $focusedLetter,
                    previousWordsLength: dailyPuzzle.previousWordsLengths[i],
                    handleCharacterChange: handleCharacterChange
                )
            }
        }
    }
}

#Preview {
    struct AnswerView_Preview: View {
        @FocusState var focusedLetter: Int?
        @State var enableCheck: Bool = false
        @State var dailyPuzzle: DailyPuzzle = DailyPuzzle(puzzle: DailyPuzzleApiResponse(
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
            AnswerView(
                dailyPuzzle: $dailyPuzzle,
                focusedLetter: $focusedLetter,
                handleCharacterChange: { _ in }
            )
        }
    }
    
    return AnswerView_Preview()
}
