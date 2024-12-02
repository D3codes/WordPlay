//
//  ParView.swift
//  Minute Cryptic
//
//  Created by David Freeman on 11/29/24.
//

import SwiftUI

struct ParView: View {
    @Binding var dailyPuzzle: DailyPuzzle
    
    func getFillColor(attempt: AttemptType) -> Color {
        switch attempt {
        case .unused:
            dailyPuzzle.solved ? .mcPurple : .clear
        case .revealLetter:
            .mcYellow
        case .hint:
            .white
        }
    }
    
    var body: some View {
        HStack {
            ForEach(Array(dailyPuzzle.parBar.enumerated()), id: \.offset) { index, attempt in
                VStack {
                    Circle()
                        .fill(getFillColor(attempt: attempt))
                        .stroke(.black, lineWidth: 3)
                        .frame(width: 20, height: 20)
                    Spacer()
                    if index == dailyPuzzle.par-1 && !dailyPuzzle.solved {
                        Image(systemName: "triangle.fill")
                            .foregroundStyle(.black)
                        Text("par")
                            .font(.custom("mulish", size: 20))
                            .foregroundStyle(.black)
                    }
                }
            }
        }
        .frame(height: 75)
    }
}

#Preview {
    struct ParView_Preview: View {
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
            ParView(dailyPuzzle: $dailyPuzzle)
        }
    }
    
    return ParView_Preview()
}
