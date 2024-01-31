//
//  OpenAIViewModel.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 05/12/2023.
//

import Foundation

@MainActor class OpenAIViewModel: ObservableObject {
    @Published var message: String = ""
    @Published var response: String = ""
    
    private let apiManger = APiManger.shared
}


extension OpenAIViewModel {
    func sendMessageToOpenAi() async {
        do {
            let result = try await apiManger.apiRequest(message: message)
            response = result.choices[0].message.content
        } catch {
            print(error.localizedDescription)
        }
    }
}

