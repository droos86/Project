//
//  Mood_v2App.swift
//  Mood v2
//
//  Created by Daniel Roos on 13.12.23.
//

import SwiftUI

@main
struct Mood_v2App: App {
    @StateObject private var databaseManager = DatabaseManager.shared
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some Scene {
            WindowGroup {
                ContentView()
        }
    }
}
