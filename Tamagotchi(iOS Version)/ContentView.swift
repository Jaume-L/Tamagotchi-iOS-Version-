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
            VStack(alignment: .leading, spacing: 5) {
                Button("Eat Snack", action: {
                    tamagotchi.eatSnack()
                })
                Button("Eat Meal", action: {
                    tamagotchi.eatMeal()
                })
                Button("Play Game", action: {
                    tamagotchi.playGame()
                })
            }
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
