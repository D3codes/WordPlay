//
//  DailyPuzzleApiResponse.swift
//  Minute Cryptic
//
//  Created by David Freeman on 11/29/24.
//

struct DailyPuzzleApiResponse: Codable {
    var letterRevealOrder: [Int]
    var hint: String
    var clue: [Clue]
    var answer: String
    //var puzzlePieces: [PuzzlePiece]
    var config: [Int]
    var par: Int
    var explainerVideo: String
    var date: String
    var thumbnail: String
}

struct Clue: Codable, Hashable {
    var text: String
    var type: String?
}

struct PuzzlePiece: Codable {
    var answer: String
    var isRevealed: Bool
    var input: String
}
