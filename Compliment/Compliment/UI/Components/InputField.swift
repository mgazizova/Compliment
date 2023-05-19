//
//  InputField.swift
//  Compliment
//
//  Created by Мария Газизова on 17.05.2023.
//

import SwiftUI

struct InputField: View {
    let placeholder: String?
    // TODO: скорее всего поменять на viewModel
    @State var text: String = ""
    
    var body: some View {
        VStack {
            TextField(placeholder ?? "",
                      text: $text)
            Divider()
                .frame(height: 1)
        }
    }
}

struct InputField_Previews: PreviewProvider {
    static var previews: some View {
        InputField(placeholder: "Placeholder", text: "text")
    }
}
