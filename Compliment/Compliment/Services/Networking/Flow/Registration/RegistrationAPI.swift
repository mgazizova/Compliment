//
//  RegistrationAPI.swift
//  Compliment
//
//  Created by Мария Газизова on 18.05.2023.
//

import Foundation
import Alamofire

enum RegistrationAPI: RequestBuilderProtocol {    
    case register(params: RegistrationRequestModel)
}

extension RegistrationAPI {
    var fulURL: URL {
        switch self {
        case .register:
            return URL(string: "\(baseURL)/user/")!
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .register:
            return nil
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case let .register(params):
            return params.toParameters
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .register:
            return .post
        }
    }
}
