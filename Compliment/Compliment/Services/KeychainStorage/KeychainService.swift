//
//  KeychainService.swift
//  Compliment
//
//  Created by Мария Газизова on 24.05.2023.
//

import Foundation
import KeychainAccess

protocol KeychainServiceProtocol {
    var keychain: Keychain { get }
    func save(_ value: String, key: KeychainKey)
    func get(by key: KeychainKey) -> String?
}

extension KeychainServiceProtocol {
    func save(_ value: String, key: KeychainKey) {
        do {
            try keychain.set(value, key: key.rawValue)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func get(by key: KeychainKey) -> String? {
        return try? keychain.get(key.rawValue)
    }
}

struct KeychainService: KeychainServiceProtocol {
    static let shared: KeychainServiceProtocol = KeychainService()
    
    var keychain = Keychain()
}

enum KeychainKey: String {
    case access
    case refresh
}
