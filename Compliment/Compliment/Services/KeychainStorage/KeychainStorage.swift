//
//  KeychainStorage.swift
//  Compliment
//
//  Created by Мария Газизова on 22.05.2023.
//

import SwiftUI
import KeychainAccess

@propertyWrapper
struct KeychainStorage: DynamicProperty {
    let key: String
    
    var wrappedValue: String {
        get { value }
        
        nonmutating set {
            value = newValue
            do {
                try Keychain().set(value, key: key)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
    var projectedValue: Binding<String> {
        Binding(get: { wrappedValue }, set: { wrappedValue = $0 })
    }
    
    @State private var value: String
    
    init(wrappedValue: String = "", key: String) {
        self.key = key
        let initialValue = (try? Keychain().get(key)) ?? wrappedValue
        self._value = State<String>(initialValue: initialValue)
    }
}
