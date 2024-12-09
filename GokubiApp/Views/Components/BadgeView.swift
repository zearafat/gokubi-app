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
    var labelColor: Color = .green700
    var backgroundColor: Color = .green100
    
    var body: some View {
        if icon?.isEmpty == false {
            HStack(alignment: .center) {
                Image(systemName: icon ?? "")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(labelColor)
                    .frame(width: 14, height: 14)
                
                Text(label)
                    .foregroundStyle(labelColor)
                    .fontWeight(.bold)
                    .font(.system(size: 12))
                    .fontDesign(.rounded)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 100))
        } else {
            Text(label)
                .foregroundStyle(labelColor)
                .fontWeight(.bold)
                .font(.system(size: 12))
                .fontDesign(.rounded)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 100))
        }
    }
}

#Preview {
    BadgeView(
        icon: "medal.fill",
        label: "Badge",
        labelColor: .green700,
        backgroundColor: .green100
    )
}
