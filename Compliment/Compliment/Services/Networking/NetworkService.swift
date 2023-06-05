//
//  NetworkService.swift
//  Compliment
//
//  Created by Мария Газизова on 18.05.2023.
//

import Foundation
import Alamofire
import Combine

protocol NetworkServiceProtocol: AnyObject {
    func execute<T: Codable>(_ urlRequest: RequestBuilderProtocol,
                             model: T.Type,
                             completion: @escaping (Result<T, APIError>) -> Void) -> AnyCancellable
}

extension NetworkServiceProtocol {
    func execute<T: Codable>(_ urlRequest: RequestBuilderProtocol,
                             model: T.Type,
                             completion: @escaping (Result<T, APIError>) -> Void) -> AnyCancellable {
        let cancellable = AF.request(urlRequest)
            .validate()
            .publishDecodable(type: T.self)
            .map { response in
                response.mapError { _ in
                    guard let data = response.data,
                          let error = try? JSONDecoder().decode([ErrorModel].self, from: data),
                          let apiError = APIError(rawValue: error[0].messages[0].code_number) else {
                        return APIError.unknownError
                    }
                    
                    return apiError
                }
            }
            .sink { result in
                if let value = result.value {
                    completion(Result.success(value))
                } else if let error = result.error {
                    completion(Result.failure(error))
                }
            }
        return cancellable
    }
}

class NetworkService: NetworkServiceProtocol {
    static let shared: NetworkServiceProtocol = NetworkService()
}
