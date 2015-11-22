//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 0, y: 3), isVertical: false)
        let smallShip1 = Ship(length: 2, location: GridLocation(x: 5, y: 2), isVertical: false)
        let largeShip1 = Ship(length: 4, location: GridLocation(x: 4, y: 1), isVertical: true)
        let xLargeShip1 = Ship(length: 5, location: GridLocation(x: 1, y: 7), isVertical: false)
        
        let mine1 = Mine(location: GridLocation(x: 3, y: 1), explosionText: "Bam!!")
        let mine2 = Mine(location: GridLocation(x: 4, y: 5), explosionText: "KaPOW!!")
        
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(smallShip1)
        human.addShipToGrid(largeShip1)
        human.addShipToGrid(xLargeShip1)
        
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
        
        
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        //var numberOfGuesses = gameStats.numberOfMissesByHuman - gameStats.numberOfHitsOnEnemy
        
        finalScore = (gameStats.enemyShipsRemaining * gameStats.sinkBonus) + (gameStats.humanShipsSunk * gameStats.shipBonus) - ((gameStats.numberOfMissesByHuman - gameStats.numberOfHitsOnEnemy) * gameStats.guessPenalty)
        
        
        return finalScore
    }
}