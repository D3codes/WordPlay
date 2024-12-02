//
//  ApiWrapper.swift
//  Minute Cryptic
//
//  Created by David Freeman on 11/29/24.
//

import Foundation

struct ApiWrapper {
    
    func getDailyPuzzle() async -> DailyPuzzle? {
        guard let url = URL(string: "https://www.minutecryptic.com/api/daily_puzzle/today?tz=\(TimeZone.current.identifier)") else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            return DailyPuzzle(puzzle: parseDailyPuzzle(json: data)!)
        } catch {
            print("Invalid data")
        }
        
        return nil
    }
    
    func parseDailyPuzzle(json: Data) -> DailyPuzzleApiResponse? {
        let decoder = JSONDecoder()
        
        if let jsonPuzzle = try? decoder.decode(DailyPuzzleApiResponse.self, from: json) {
            return jsonPuzzle
        }
        
        return nil
    }
}
