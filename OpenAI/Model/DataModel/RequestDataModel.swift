//
//  UserMessageDataModel.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 05/12/2023.
//

import Foundation

struct RequestData: Encodable {
    let model: String
    let messages: [UserMessage]
}

struct UserMessage: Encodable {
    let role: String = "user"
    let content: String
}

