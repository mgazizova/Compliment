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
                             completion: @escaping (Result<T, AFError>) -> Void) -> AnyCancellable
}

extension NetworkServiceProtocol {
    func execute<T: Codable>(_ urlRequest: RequestBuilderProtocol,
                             model: T.Type,
                             completion: @escaping (Result<T, AFError>) -> Void) -> AnyCancellable {
        let requestPublisher = AF.request(urlRequest).publishDecodable(type: T.self)
        let cancellable = requestPublisher
            .subscribe(on: DispatchQueue(label: "Background Queue", qos: .background))
            .receive(on: RunLoop.main).sink { result in
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
