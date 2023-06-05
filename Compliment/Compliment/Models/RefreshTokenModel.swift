//
//  RefreshTokenModel.swift
//  Compliment
//
//  Created by Мария Газизова on 23.05.2023.
//

import Foundation
import Alamofire

struct RefreshTokenRequestModel: Codable, Parameterizable {
    var refresh: String? {
        return KeychainService.shared.get(by: .refresh)
    }
    
    var toParameters: Parameters? {
        guard let refresh else { return nil }
        
        let params = [
            "refresh": refresh
        ]
        return params
    }
}

struct RefreshTokenResponseModel: Codable {
    var access: String
    var refresh: String
}
