//
//  ContentView.swift
//  Tamagotchi(iOS Version)
//
//  Created by Jaume, Louis (NA) on 21/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tamagotchi = Tamagotchi()
    
    var body: some View {
        Form {
            Section {
                Text("\(tamagotchi.displayStats())")
            }
            Section {
                Button("Eat Snack", action: {
                    tamagotchi.eatSnack()
                }).disabled(tamagotchi.getIsAlive() == false)
                Button("Eat Meal", action: {
                    tamagotchi.eatMeal()
                }).disabled(tamagotchi.getIsAlive() == false)
                Button("Play Game", action: {
                    tamagotchi.playGame()
                }).disabled(tamagotchi.getIsAlive() == false)
                Button("Give Medicine", action: {
                    tamagotchi.medicate()
                }).disabled(tamagotchi.getIsAlive() == false)
                Button("Clean Up", action: {
                    tamagotchi.cleanUp()
                }).disabled(tamagotchi.getIsAlive() == false)
            }
            Section {
                Image("tamagot")
            }
        }.onAppear {
            tamagotchi.excrete()
            tamagotchi.startAging()
            tamagotchi.getHungry()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 13 Pro")
        }
    }
}
