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
    @Published var isLoading: Bool = false
    
    private let apiManger = APiManger.shared
}


extension OpenAIViewModel {
    func sendMessageToOpenAi() async {
        let messageRequest = message
        isLoading = true
        response = ""
        message = ""
        do {
            let result = try await apiManger.apiRequest(message: messageRequest)
            let AiResponse = result.choices[0].message.content
            TypoAnimation(for: AiResponse)
            isLoading = false
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension OpenAIViewModel {
    private func TypoAnimation(for AiResponse: String) {
        var charindex = 0.0
        
        for letter in AiResponse {
            Timer.scheduledTimer(withTimeInterval: 0.02*charindex, repeats: false) { timer in // small number equale to fast writing
                if letter != "." {
                    self.response.append(letter)
                }
            }
            charindex += 1
        }
    }
}


