//
//  Intarget_SwiftUITests.swift
//  Intarget_SwiftUITests
//
//  Created by Bruno Teixeira Lemgruber Correa on 22/11/21.
//

import XCTest
@testable import Intarget_SwiftUI

class Intarget_SwiftUITests: XCTestCase {
    
    var game: Game!
    
    override func setUpWithError() throws {
        game = Game()
    }
    
    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative(){
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
}
