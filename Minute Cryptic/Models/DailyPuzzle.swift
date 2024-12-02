//
//  DailyPuzzle.swift
//  Minute Cryptic
//
//  Created by David Freeman on 11/29/24.
//

struct DailyPuzzle: Encodable, Decodable {
    var puzzle: DailyPuzzleApiResponse
    
    var answerWithoutSpaces: String { return puzzle.answer.replacingOccurrences(of: " ", with: "").lowercased() }
    
    var answerCharacterCount: Int { return puzzle.answer.replacingOccurrences(of: " ", with: "").count }
    
    var answerWordLengths: [Int] { return puzzle.config }
    
    var wordsInAnswer: Int { return puzzle.config.count }
    
    var previousWordsLengths: [Int] = []
    
    var answerPieces: [Piece] = []
    
    var par: Int { return puzzle.par }
    
    var parBar: [AttemptType] = []
    
    var solved: Bool = false
    
    var highlightDefinition: Bool { return parBar.contains(.hint) }
    
    var clueString: String {
        let clue = puzzle.clue.map { $0.text }.joined(separator: " ")
        let answerWordCountText = puzzle.config.map { "\($0)" }
        
        return "\"\(clue)\" (\(answerWordCountText.joined(separator: ", ")))"
    }
    
    init(puzzle: DailyPuzzleApiResponse) {
        self.puzzle = puzzle
        
        var previousLengths: [Int] = [0]
        
        for i in 1..<puzzle.config.count {
            var previousLength = 0
            for j in 0..<i {
                previousLength += puzzle.config[j]
            }
            previousLengths.append(previousLength)
        }
        
        self.previousWordsLengths = previousLengths
        
        parBar = Array(repeating: .unused, count: answerCharacterCount + 1)
        
        answerPieces = Array(repeating: Piece(letter: "", revealed: false), count: answerCharacterCount)
    }
}

enum AttemptType: Encodable, Decodable {
    case hint, revealLetter, unused
}

struct Piece: Encodable, Decodable {
    var letter: String
    var revealed: Bool
}
