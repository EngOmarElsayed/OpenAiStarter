//
//  AiResponse.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 05/12/2023.
//

import Foundation

// This the data model used to decode the json response

struct AiResponse {
    let choices: [Response]
}

struct Response {
    let message: Message

}

struct Message {
    let content: String
    let role: String
}
