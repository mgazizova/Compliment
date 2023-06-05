//
//  RequestBuilderProtocol.swift
//  Compliment
//
//  Created by Мария Газизова on 18.05.2023.
//

import Foundation
import Alamofire

protocol RequestBuilderProtocol: URLRequestConvertible {
    var baseURL: String { get }
    var fulURL: URL { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
}

extension RequestBuilderProtocol {
    var baseURL: String {
        return APIEnvironment.development.baseURL()
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: fulURL)
        request.method = method
        headers?.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.name)
        }
        return try encoding.encode(request, with: parameters)
    }
}
