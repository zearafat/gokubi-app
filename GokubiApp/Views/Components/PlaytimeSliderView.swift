//
//  PlaytimeSliderView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 11/11/24.
//

import SwiftUI

struct PlaytimeSliderView: View {
    @Binding var playtime: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            let formattedPlaytime = Int(playtime) // Format as Int for display
	
            // Display playtime text
            Text("Playtime: \(formattedPlaytime) hours")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            // Slider to update playtime
            Slider(value: $playtime, in: 0...500, step: 1) // Ensure playtime is a Double in your model
        }
    }
}

//#Preview {
//    PlaytimeSliderView()
//}
