//
//  TitleView.swift
//  Compliment
//
//  Created by Мария Газизова on 17.05.2023.
//

import SwiftUI

struct TitleView: View {
    let title: String
    
    init(with title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(.title)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(with: "Title preview")
    }
}
