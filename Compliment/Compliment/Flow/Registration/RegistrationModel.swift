//
//  RegistrationModel.swift
//  Compliment
//
//  Created by Мария Газизова on 18.05.2023.
//

import Foundation
import Alamofire

struct RegistrationRequestModel: Codable {
    var username: String
    var email: String
    var password: String
    var name: String? = nil
    var last_name: String? = nil
    var birthday: String? = nil
    
    var toParameters: Parameters {
        let params = [
            "username" : username,
            "email": email,
            "password": password,
            "name": name ?? "",
            "last_name": last_name ?? "",
            "birthday":  birthday ?? ""
        ]
        return params
    }
}

struct RegistrationResponseModel: Codable {
    var username: String
    var name: String?
    var last_name: String?
    var email: String
    var birthday: String?
}
