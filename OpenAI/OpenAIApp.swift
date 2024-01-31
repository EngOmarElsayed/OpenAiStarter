//
//  OpenAIApp.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 05/12/2023.
//

import SwiftUI

@main
struct OpenAIApp: App {
    @StateObject var viewModel = OpenAIViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
