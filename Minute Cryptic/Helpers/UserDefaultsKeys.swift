//
//  UserDefaultsKeys.swift
//  Minute Cryptic
//
//  Created by David Freeman on 12/1/24.
//

import Foundation

struct UserDefaultsKeys {
    func dailyPuzzleKey() -> String {
        let Formatter = DateFormatter()
        Formatter.dateFormat = "yyyy-MM-dd"
        let date = Formatter.string(from: Date())
        
        return "dailyPuzzle-\(date)"
    }
}
