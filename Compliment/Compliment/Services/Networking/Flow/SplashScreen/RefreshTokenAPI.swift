//
//  RefreshTokenAPI.swift
//  Compliment
//
//  Created by Мария Газизова on 23.05.2023.
//

import Foundation
import Alamofire

enum RefreshTokenAPI: RequestBuilderProtocol {
    case refresh
}

extension RefreshTokenAPI {
    var fulURL: URL {
        switch self {
        case .refresh:
            return URL(string: "\(baseURL)/login/refresh")!
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .refresh:
            return nil
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .refresh:
            return RefreshTokenRequestModel().toParameters
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .refresh:
            return .post
        }
    }
}
