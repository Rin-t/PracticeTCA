//
//  PracticeTCAApp.swift
//  PracticeTCA
//
//  Created by Rin on 2024/03/04.
//

import SwiftUI
import ComposableArchitecture

@main
struct PracticeTCAApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(initialState: Multiplication.State()) {
                    Multiplication()
                }
            )
        }
    }
}
