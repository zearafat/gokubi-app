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
        VStack(alignment: .leading) {
            Text("Rating")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                ForEach(1...5, id: \.self) { star in
                    Image(systemName: star <= Int(rating) ? "star.fill" : "star")
                        .foregroundColor(.violet600)
                        .onTapGesture {
                            withAnimation {
                                rating = Int(star)
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
