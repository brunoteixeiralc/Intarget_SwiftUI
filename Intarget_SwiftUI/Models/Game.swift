//
//  Game.swift
//  Intarget_SwiftUI
//
//  Created by Bruno Teixeira Lemgruber Correa on 25/11/21.
//

import Foundation

struct LeaderBoardEntry {
    var score: Int
    var date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderBoardEntry] = []
    
    init(loadTestData:Bool = false){
        leaderboardEntries.append(LeaderBoardEntry(score: 100, date: Date()))
        leaderboardEntries.append(LeaderBoardEntry(score: 80, date: Date()))
        leaderboardEntries.append(LeaderBoardEntry(score: 200, date: Date()))
        leaderboardEntries.append(LeaderBoardEntry(score: 30, date: Date()))
        leaderboardEntries.append(LeaderBoardEntry(score: 500, date: Date()))
        
    }
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        let bonus: Int

        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        }else{
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    mutating func addToLeaderBoard(point: Int){
        leaderboardEntries.append(LeaderBoardEntry(score: point, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    mutating func startNewRound(points: Int) {
        round += 1
        score += points
        target = Int.random(in: 1...100)
        addToLeaderBoard(point: points)
    }
    
    mutating func restart(){
        round = 1
        score = 0
        target = Int.random(in: 1...100)
    }
}
