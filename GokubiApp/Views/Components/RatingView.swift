//
//  RatingView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 11/11/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Rating")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                ForEach(1...5, id: \.self) { heart in
                    Image(systemName: heart <= Int(rating) ? "heart.fill" : "heart")
                        .frame(width: 34, height: 34)
                        .foregroundColor(.red)
                        .onTapGesture {
                            withAnimation {
                                rating = Int(heart)
                            }
                        }
                        .contentTransition(.symbolEffect(.replace))
                }
            }
        }
    }
}

//#Preview {
//    RatingView()
//}
