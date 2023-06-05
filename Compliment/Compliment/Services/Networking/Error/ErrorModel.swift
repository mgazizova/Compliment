//
//  ErrorModel.swift
//  Compliment
//
//  Created by Мария Газизова on 23.05.2023.
//

import Foundation

struct ErrorModel: Codable {
    var field: String
    var messages: [ErrorMessage]
}

struct ErrorMessage: Codable {
    var text: String
    var code_number: Int
}
