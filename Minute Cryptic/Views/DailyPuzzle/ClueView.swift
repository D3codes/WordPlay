//
//  ClueView.swift
//  Minute Cryptic
//
//  Created by David Freeman on 11/29/24.
//

import SwiftUI

struct ClueView: View {
    @Binding var dailyPuzzle: DailyPuzzle
    
    var message: AttributedString {
        var result: AttributedString = ""
        
        for clue in dailyPuzzle.puzzle.clue {
            if clue.type == "definition" && dailyPuzzle.highlightDefinition {
                var highlight = AttributedString(clue.text)
                highlight.backgroundColor = Color("mcBlue")
                result += highlight
            } else {
                result += AttributedString(clue.text)
            }
            result += " "
        }
        
        let answerWordCountText = dailyPuzzle.puzzle.config.map { "\($0)" }
        result += AttributedString("(\(answerWordCountText.joined(separator: ", ")))")
        
        return result
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.background)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 10)
            
            Text(message)
                .font(.custom("mulish", size: 20))
                .bold()
                .padding(20)
                .foregroundStyle(.primary)
        }
        .frame(maxHeight: 100)
    }
}

#Preview {
    struct ClueView_Preview: View {
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
            ClueView(dailyPuzzle: $dailyPuzzle)
        }
    }
    
    return ClueView_Preview()
}
