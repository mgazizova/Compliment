//
//  RegistrationModel.swift
//  Compliment
//
//  Created by Мария Газизова on 18.05.2023.
//

import Foundation
import Alamofire

protocol Parameterizable {
    var toParameters: Parameters? { get }
}

struct RegistrationRequestModel: Codable, Parameterizable {
    var username: String
    var email: String
    var password: String
    
    var toParameters: Parameters? {
        let params = [
            "username" : username,
            "email": email,
            "password": password
        ]
        return params
    }
}

struct RegistrationResponseModel: Codable {
    var instance: InstanceModel
    var access: String
    var refresh: String
}

struct InstanceModel: Codable {
    var username: String
    var name: String?
    var last_name: String?
    var email: String
    var birthday: String?
}
