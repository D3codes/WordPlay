//
//  DailyPuzzleView.swift
//  Minute Cryptic
//
//  Created by David Freeman on 11/29/24.
//

import SwiftUI
import SwiftData
import Combine

struct DailyPuzzleView: View {
    let defaults = UserDefaults.standard
    @State var dailyPuzzle: DailyPuzzle
    
    @State var enableCheck: Bool = false
    @State var shake: Bool = false
    
    @State var popupTitle: String = ""
    @State var popupMessage: String = ""
    @State var popupBackgroundColor: Color = .white
    @State var isPopupPresented: Bool = false
    
    @FocusState var focusedLetter: Int?
    
    @State var presentHelpSheet: Bool = false
    
    func savePuzzle() {
        if let encoded = try? JSONEncoder().encode(dailyPuzzle) {
            self.defaults.set(encoded, forKey: UserDefaultsKeys().dailyPuzzleKey())
            self.defaults.synchronize()
        }
    }
    
    func checkAnswer() {
        if (dailyPuzzle.answerPieces.reduce("") { $0 + $1.letter } != dailyPuzzle.answerWithoutSpaces) {
            shake.toggle()
            showKeepTryingPopup()
        } else {
            dailyPuzzle.solved = true
            focusedLetter = nil
        }
        
        savePuzzle()
    }
    
    func showKeepTryingPopup() {
        popupTitle = "Keep Trying!"
        popupMessage = "You can show a letter for some help!"
        popupBackgroundColor = Color("mcYellow")
        isPopupPresented = true
    }
    
    func showHint() {
        if !dailyPuzzle.highlightDefinition {
            let firstIndex = dailyPuzzle.parBar.firstIndex { attempt in
                attempt == .unused
            }
            if firstIndex != nil {
                dailyPuzzle.parBar[firstIndex!] = .hint
            }
        }
        
        showHintPopup()
        savePuzzle()
    }
    
    func showHintPopup() {
        popupTitle = "Hint"
        popupMessage = dailyPuzzle.puzzle.hint
        popupBackgroundColor = .white
        isPopupPresented = true
    }
    
    func revealLetter() {
        let revealedLettersCount = dailyPuzzle.answerPieces.reduce(0) { $1.revealed ? $0 + 1 : $0}
        if revealedLettersCount >= dailyPuzzle.puzzle.letterRevealOrder.count {
            return
        }
        let indexOfNextLetterToReveal = dailyPuzzle.puzzle.letterRevealOrder[revealedLettersCount]
        let letterToReveal = Array(dailyPuzzle.answerWithoutSpaces)[indexOfNextLetterToReveal]
        
        dailyPuzzle.answerPieces[indexOfNextLetterToReveal].revealed = true
        dailyPuzzle.answerPieces[indexOfNextLetterToReveal].letter = "\(letterToReveal)"
        
        let firstIndex = dailyPuzzle.parBar.firstIndex { attempt in
            attempt == .unused
        }
        if firstIndex != nil {
            dailyPuzzle.parBar[firstIndex!] = .revealLetter
        }
        
        if revealedLettersCount == dailyPuzzle.puzzle.letterRevealOrder.count-1 {
            dailyPuzzle.solved = true
            focusedLetter = nil
        }
        
        savePuzzle()
    }
    
    func handleCharacterChange(index: Int) {
        trimAllButLastCharacter(index: index)
        tryEnableCheck()
    }
    
    func trimAllButLastCharacter(index: Int) {
        if dailyPuzzle.answerPieces[index].letter.count > 0 {
            dailyPuzzle.answerPieces[index].letter = String(dailyPuzzle.answerPieces[index].letter.suffix(1))
            incrementFocusedLetter(index: index)
        }
    }
    
    func incrementFocusedLetter(index: Int) {
        if index < dailyPuzzle.answerCharacterCount-1 && index == focusedLetter {
            let subPieces = dailyPuzzle.answerPieces[index+1..<dailyPuzzle.answerCharacterCount]
            let nextIndex: Int? = subPieces.firstIndex(where: { $0.revealed == false })
            
            if nextIndex != nil {
                focusedLetter = nextIndex!
            }
        }
    }
    
    func decrementFocusedLetter(index: Int) {
        if index > 0 && index == focusedLetter {
            let subPieces = dailyPuzzle.answerPieces[0..<index]
            let lastIndex: Int? = subPieces.lastIndex(where: { $0.revealed == false })
            
            if lastIndex != nil {
                focusedLetter = lastIndex!
            }
        }
    }
    
    func tryEnableCheck() {
        let charCount: Int = dailyPuzzle.answerPieces.reduce(0) { $0 + $1.letter.count }
        enableCheck = charCount == dailyPuzzle.answerCharacterCount
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(showHelpSheet: $presentHelpSheet)
            ScrollView {
                ClueView(dailyPuzzle: $dailyPuzzle)
                AnswerView(
                    dailyPuzzle: $dailyPuzzle,
                    focusedLetter: $focusedLetter,
                    handleCharacterChange: { handleCharacterChange(index: $0) })
                .padding(.vertical, 30)
                .shake($shake)
                if !dailyPuzzle.solved {
                    ZStack {
                        VStack {
                            ActionButtonsView(
                                enableCheck: $enableCheck,
                                checkAnswer: { self.checkAnswer() },
                                showHint: { self.showHint() },
                                revealLetter: { self.revealLetter() })
                            .padding(.bottom, 25)
                            ParView(dailyPuzzle: $dailyPuzzle)
                            Spacer()
                        }
                        if isPopupPresented {
                            VStack {
                                Spacer()
                                PopupView(
                                    isPresented: $isPopupPresented,
                                    title: $popupTitle,
                                    message: $popupMessage,
                                    backgroundColor: $popupBackgroundColor
                                )
                            }
                        }
                    }
                } else {
                    GameOverView(dailyPuzzle: dailyPuzzle)
                }
            }
        }
        .onKeyPress(keys: [.delete]) { press in
            if dailyPuzzle.answerPieces[focusedLetter!].letter.count > 0 {
                dailyPuzzle.answerPieces[focusedLetter!].letter = ""
            } else if focusedLetter! > 0 {
                decrementFocusedLetter(index: focusedLetter!)
            }
            
            return .handled
        }
        .background(Color("mcBlue"))
        .onAppear {
            self.focusedLetter = 0
        }
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $presentHelpSheet, content: {
            HelpView()
        })
    }
}

#Preview {
    NavigationStack {
        DailyPuzzleView(dailyPuzzle: DailyPuzzle(puzzle: DailyPuzzleApiResponse(
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
        )))
    }
}
