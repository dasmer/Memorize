//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Dasmer Singh on 12/18/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
