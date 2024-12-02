//
//  GameOverView.swift
//  Minute Cryptic
//
//  Created by David Freeman on 12/1/24.
//

import SwiftUI
import Foundation

struct GameOverView: View {
    @State var dailyPuzzle: DailyPuzzle
    
    func getScore() -> String {
        let attemptCount = dailyPuzzle.parBar.reduce(0) { $0 + ($1 == .unused ? 0 : 1) }
        if attemptCount < dailyPuzzle.par {
            return "\(dailyPuzzle.par - attemptCount) under par"
        }
        
        if attemptCount > dailyPuzzle.par {
            return "\(attemptCount - dailyPuzzle.par) over par"
        }
        
        return "even par"
    }
    
    func getParBubbles() -> String {
        var bubbles: String = ""
        
        dailyPuzzle.parBar.forEach { attempt in
            if attempt == .hint {
                bubbles += "⚪️"
            } else if attempt == .revealLetter {
                bubbles += "🟡"
            } else {
                bubbles += "🟣"
            }
        }
        
        return bubbles
    }
    
    func getSharePreviewTitle() -> String {
        let Formatter = DateFormatter()
        Formatter.dateFormat = "d MMMM yyyy"
        let date = Formatter.string(from: Date())
        
        return "Minute Cryptic - \(date)"
    }
    
    func getShareItem() -> String {
        return "\(getSharePreviewTitle())\n\(dailyPuzzle.clueString)\n\(getParBubbles())\nI scored: \(getScore())\nhttps://www.minutecryptic.com/?utm_source=share"
    }
    
    func getTitle() -> String {
        if(dailyPuzzle.parBar.reduce(0) { $0 + ($1 != .unused ? 0 : 1) } == 1) {
            return "This was a stretch!"
        }
        
        return "You got it!"
    }
    
    func getBody() -> String {
        if(dailyPuzzle.parBar.reduce(0) { $0 + ($1 != .unused ? 0 : 1) } == 1) {
            return "Today's Minute Cryptic was a hard one"
        }
        
        return "You solved today's Minute Cryptic in"
    }
    
    var body: some View {
        VStack {
            Text(getTitle())
                .font(.custom("mulish", size: 30))
                .bold()
                .foregroundStyle(.black)
            Text(getBody())
                .font(.custom("mulish", size: 20))
                .padding(.vertical, 1)
                .foregroundStyle(.black)
            Text(getScore())
                .font(.custom("mulish", size: 20))
                .bold()
                .foregroundStyle(.black)
            ParView(dailyPuzzle: $dailyPuzzle)
            
            ShareLink(item: getShareItem(), preview: SharePreview(
                getSharePreviewTitle(),
                image: Image("logo")
            )) {
                ZStack {
                    Capsule()
                        .stroke(.black, lineWidth: 5)
                        .fill(.mcPurple)
                        .frame(width: 200, height: 45)
                    Text("share!")
                        .font(.custom("sansita", size: 25))
                        .tint(.black)
                        .bold()
                }
            }
            
            Link(destination: URL(string: dailyPuzzle.puzzle.explainerVideo)!) {
                ZStack {
                    AsyncImage(url: URL(string: dailyPuzzle.puzzle.thumbnail)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.mcBlue
                    }
                    .frame(width: 250, height: 150)
                    .cornerRadius(7)
                    .padding(5)
                    .background(.black)
                    .cornerRadius(10)
                    
                    Image("ytLogo")
                        .resizable()
                        .frame(width: 45, height: 30)
                }
            }
            Text("Support this project by watching our 90-second explanation. Leave a comment and see what others thought!")
                .font(.custom("mulish", size: 15))
                .foregroundStyle(.black)
                .padding(.horizontal, 10)
            
            Spacer()
        }
    }
}

#Preview {
    struct GameOverView_Preview: View {
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
            GameOverView(dailyPuzzle: dailyPuzzle)
        }
    }
    
    return GameOverView_Preview()
}
