//
//  Tamagotchi.swift
//  Tamagotchi(iOS Version)
//
//  Created by Jaume, Louis (NA) on 21/01/2023.
//

import Foundation

class Tamagotchi: ObservableObject {
//attributes
    @Published private var weight: Int
    @Published private var hunger: Int
    @Published private var happiness: Int
    @Published private var age: Int
    @Published private var droppingCount: Int
    @Published private var health: Int
    @Published private var isAlive: Bool
    @Published private var timer: Timer?
    
//constructor
    init() {
        weight = 2
        hunger = 2
        happiness = 2
        age = 0
        droppingCount = 0
        health = 10
        isAlive = true
    }
    
//get methods
    func getWeight() -> Int {
        return weight
    }
    
    func getHunger() -> Int {
        return hunger
    }
    
    func getHappiness() -> Int {
        return happiness
    }
    
    func getAge() -> Int {
        return age
    }
    
    func getDroppingCount() -> Int {
        return droppingCount
    }
    
    func getHealth() -> Int {
        return health
    }
    
    func getIsAlive() -> Bool {
        return isAlive
    }
    
//set methods
    func setWeight(_ newWeight: Int) {
        if newWeight < 0 {
            weight = 0
            isAlive = false
        } else if newWeight > 10 {
            weight = 10
            setHealth(health - 1)
        } else {
            weight = newWeight
        }
    }
    
    func setHunger(_ newHunger: Int) {
        if newHunger < 0 {
            hunger = 0
            isAlive = false
        } else if newHunger > 10 {
            hunger = 10
        } else {
            hunger = newHunger
        }
    }
    
    func setHappiness(_ newHappiness: Int) {
        if newHappiness < 0 {
            happiness = 0
            isAlive = false
        } else if newHappiness > 10 {
            happiness = 10
        } else {
            happiness = newHappiness
        }
    }
    
    func setAge(_ newAge: Int) {
        if newAge < 0 {
            age = 0
        } else if newAge > 50 {
            isAlive = false
        } else {
            age = newAge
        }
    }
    
    func setDroppingCount(_ newDroppingCount: Int) {
        if newDroppingCount < 0 {
            droppingCount = 0
        } else if newDroppingCount > 5 {
            setHealth(health - 2)
        } else {
            droppingCount = newDroppingCount
        }
    }
    
    func setHealth(_ newHealth: Int) {
        if newHealth < 0 {
            health = 0
            isAlive = false
        } else if newHealth > 10 {
            health = 10
        } else {
            health = newHealth
        }
    }

//general methods
    func eatMeal() {
        if hunger < 10 {
            setHunger(hunger + 1)
            setWeight(weight + 1)
        }
    }
    
    func eatSnack() {
        setHappiness(happiness + 1)
        setWeight(weight + 1)
    }
    
    func playGame() {
        setHappiness(happiness + 1)
    }
    
    func excrete() {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) {timer in
            if self.weight > 2 {
                self.setDroppingCount(self.droppingCount + 1)
                self.setHappiness(self.happiness - 2)
                self.setWeight(self.weight - 1)
                self.setHunger(self.hunger - 2)
            }
        }
    }
    
    func startAging() {
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) {timer in
            self.setAge(self.age + 1)
        }
    }
    
    func getHungry() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) {timer in
            self.setHunger(self.hunger - 1)
        }
    }
    
    
    func cleanUp() {
        setHappiness(happiness + 1)
        setDroppingCount(droppingCount - 1)
    }
    
    func medicate() {
        setHealth(health + 2)
    }
    
    func displayStats() -> String {
        return """
        Hunger: \(hunger)
        Happiness: \(happiness)
        Weight: \(weight)
        Age: \(age)
        Number of Poos: \(droppingCount)
        Health: \(health)
        Alive: \(isAlive)
        """
    }
    
}
