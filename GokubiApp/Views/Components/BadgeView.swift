//
//  BadgeView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 28/11/24.
//

import SwiftUI

struct BadgeView: View {
    var icon: String? = ""
    var label: String = ""
    var labelColor: Color = .white
    var backgroundColor: Color = .green
    
    var body: some View {
        if icon?.isEmpty == false {
            HStack {
                Image(systemName: icon ?? "")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(labelColor)
                    .frame(width: 18, height: 18)
                
                Text(label)
                    .foregroundStyle(labelColor)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .fontDesign(.rounded)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 100))
        } else {
            Text(label)
                .foregroundStyle(labelColor)
                .fontWeight(.semibold)
                .font(.subheadline)
                .fontDesign(.rounded)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 100))
        }
    }
}

#Preview {
    BadgeView(
        icon: "medal.fill",
        label: "Badge",
        labelColor: .white,
        backgroundColor: .green
    )
}
