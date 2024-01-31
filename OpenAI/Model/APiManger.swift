//
//  APiManger.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 05/12/2023.
//

import Foundation

final class APiManger {
    private let apiKey = "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" // your api key.
    private let url = "https://api.openai.com/v1/chat/completions" // api url
    private let urlSession = URLSession.shared
    static let shared = APiManger()
    private init() {}
}

extension APiManger {
    
    func apiRequest(message: String) async throws -> AiResponse {
        guard let url = URL(string: url) else { throw error.invalidURL }
        
        let urlRequest = try configUrlRequest(message: message, url: url)
        
        let (data, response) = try await urlSession.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw error.invalidResponse }
        
        return try JSONDecoder().decode(AiResponse.self, from: data)
    }
    
    private func configUrlRequest(message: String, url: URL) throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        let message = RequestData(model: "gpt-3.5-turbo", messages: [UserMessage(content: message)])
        let urlBody = try JSONEncoder().encode(message)
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        urlRequest.httpBody = urlBody
        
        return urlRequest
    }
    
}

private extension APiManger {
    enum error: Error {
        case invalidURL
        case invalidResponse
    }
}
