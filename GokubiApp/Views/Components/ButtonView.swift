//
//  ButtonView.swift
//  gokubi.app
//
//  Created by Alzea Arafat on 06/11/24.
//

import SwiftUI

struct ButtonView: View {
    var label: String = ""
    var textColor: Color = .black
    var backgroundColor: Color = .white
    var action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            Text(label)
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(textColor)
        .padding()
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview {
    ButtonView(
        label: "Button",
        textColor: .white,
        backgroundColor: .black
    )
}
