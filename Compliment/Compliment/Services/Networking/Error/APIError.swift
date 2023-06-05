//
//  APIError.swift
//  Compliment
//
//  Created by Мария Газизова on 24.05.2023.
//

import Foundation

enum APIError: Int, Error {
    case unknownError = 1000
    case unrecognizedError = 0
    case baseError = 1
    case validationError = 2
    case parsingError = 3
    case authenticationError = 4
    case authenticationValidationError = 5
    case permissionError = 6
    case objectNotFound = 7
    case restMethodNotAllowed = 8
    case wrongHeadersError = 9
    case unsupportedMediaTypes = 10
    case tooManyRequests = 11
    
    var localizedDescription: String {
        switch self {
        case .unrecognizedError:
            return "unrecognized error"
        case .baseError:
            return "sfj"
        case .validationError:
            return ""
        case .parsingError:
            return ""
        case .authenticationError:
            return ""
        case .authenticationValidationError:
            return ""
        case .permissionError:
            return ""
        case .objectNotFound:
            return ""
        case .restMethodNotAllowed:
            return ""
        case .wrongHeadersError:
            return ""
        case .unsupportedMediaTypes:
            return ""
        case .tooManyRequests:
            return ""
        default:
            return "weflkwefmk"
        }
    }
}
