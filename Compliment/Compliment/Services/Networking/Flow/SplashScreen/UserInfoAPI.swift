//
//  UserInfoAPI.swift
//  Compliment
//
//  Created by Мария Газизова on 24.05.2023.
//

import Foundation
import Alamofire

enum UserInfoAPI: RequestBuilderProtocol {
    case getInfo
}

extension UserInfoAPI {
    var fulURL: URL {
        switch self {
        case .getInfo:
            return URL(string: "\(baseURL)/user/my")!
        }
    }
    
    var headers: HTTPHeaders? {
        guard let token = KeychainService.shared.get(by: .access) else { return nil }
        
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        return headers
    }
    
    var parameters: Parameters? {
        switch self {
        case .getInfo:
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getInfo:
            return .get
        }
    }
}
