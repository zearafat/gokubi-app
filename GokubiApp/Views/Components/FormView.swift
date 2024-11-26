//
//  FormView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 26/11/24.
//

import SwiftUI

struct FormView: View {
    var placeholderText: String = "Placeholder text"
    var bindingText: Binding<String>
    var backgroundColor: Color = .slate100
    
    var body: some View {
        TextField(placeholderText, text: bindingText)
            .autocorrectionDisabled(true)
            .padding()
            .background(backgroundColor)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
}
