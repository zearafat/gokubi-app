//
//  ButtonView.swift
//  GokubiApp.app
//
//  Created by Alzea Arafat on 06/11/24.
//

import SwiftUI

struct ButtonView: View {
    var label: String = ""
    var textColor: Color = .black
    var textSize: CGFloat = 16
    var backgroundColor: Color = .white
    var dropShadowColor: Color = .purple
    var action: (() -> Void)?
    var disabled: Bool = false
    var hasIcon: Bool = false
    var iconName: String = ""
    
    var body: some View {
        if disabled {
            Button {
                action?()
            } label: {
                if hasIcon {
                    Image(systemName: iconName)
                }
                Text(label)
                    .font(.system(size: textSize))
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            .foregroundStyle(textColor)
            .fontWeight(.black)
            .fontDesign(.rounded)
            .padding()
            .background(Color.slate400)
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .shadow(color: Color.slate500, radius: 0, x: 0, y: 7)
            .disabled(disabled)
        } else {
            Button {
                action?()
            } label: {
                if hasIcon {
                    HStack(alignment: .center, spacing: 14) {
                        Image(systemName: iconName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                        
                        Text(label)
                            .font(.system(size: textSize))
                    }
                    .frame(maxWidth: .infinity)
                } else {
                    Text(label)
                        .font(.system(size: textSize))
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(maxWidth: .infinity)
            .foregroundStyle(textColor)
            .fontWeight(.black)
            .fontDesign(.rounded)
            .padding()
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .shadow(color: dropShadowColor.opacity(100), radius: 0, x: 0, y: 7)
            .disabled(disabled)
        }
    }
}

#Preview {
    ButtonView(
        label: "Button",
        textColor: .white,
        textSize: 14,
        backgroundColor: .violet600,
        dropShadowColor: .violet800,
        action: nil,
        disabled: false,
        hasIcon: true,
        iconName: "plus"
    )
}
