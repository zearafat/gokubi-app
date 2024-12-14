//
//  TagChipView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 13/12/24.
//

import SwiftUI

struct TagChipView: View {
    var icon: String? = nil
    var label: String = ""
    
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            if let icon = icon {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
            
            Text(label)
                .font(.system(size: 12))
                .fontWeight(.semibold)
        }
        .fontDesign(.rounded)
        .foregroundColor(Color.black)
        .padding(.vertical, 6)
        .padding(.horizontal, 8)
        .background(.slate50)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(color: Color.gray.opacity(0.25), radius: 0, x: 0, y: 4)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Color.slate200, lineWidth: 1)
        )
    }
}

#Preview {
    TagChipView(
        icon: "platforms",
        label: "Hello World"
    )
}
