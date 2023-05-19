//
//  PasswordField.swift
//  Compliment
//
//  Created by Мария Газизова on 17.05.2023.
//

import SwiftUI

struct PasswordField: View {
    @State private var isSecured = true
    @State var password: String = ""
    
    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                HStack(alignment: .bottom) {
                    Group {
                        if isSecured {
                            SecureField("Password", text: $password)
                        } else {
                            TextField("Password", text: $password)
                        }
                    }
                    
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    }
                }
                .frame(height: 22)
            }
            Divider()
                .frame(height: 1)
        }
    }
}

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordField()
    }
}
