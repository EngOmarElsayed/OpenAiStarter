//
//  AiResponse.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 05/12/2023.
//

import Foundation

// This the data model used to decode the json response

struct AiResponse: Decodable {
    let choices: [Response]
}

struct Response: Decodable {
    let message: Message
}

struct Message: Decodable {
    let content: String
    let role: String
}
























//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
