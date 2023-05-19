//
//  APIEnvironment.swift
//  Compliment
//
//  Created by Мария Газизова on 18.05.2023.
//

import Foundation

enum APIEnvironment {
    case development
    case production
    
    func baseURL() -> String {
        return "http://\(domain())\(route())"
    }
    
    private func domain() -> String {
        switch self {
        case .development:
            return "193.168.3.198:8000"
        case .production:
            return ""
        }
    }
    
    private func route() -> String {
        switch self {
        case .development, .production:
            return  "/api/v1_0"
        }
    }
}
