//
//  UserMessageDataModel.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 05/12/2023.
//

import Foundation

struct RequestData {
    let model: String
    let message: [UserMessage]
    let temperature: Double = 0.2
}

struct UserMessage {
    let role: String = "user"
    var content: String
}
