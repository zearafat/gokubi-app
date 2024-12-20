//
//  OnboardingSlideView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 20/12/24.
//

import SwiftUI

struct OnboardingSlideView: View {
    var image: String = ""
    var title: String = ""
    var description: String = ""
    var buttonAction: (() -> Void)? = { }
    var isLastSlide: Bool = false
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack(alignment: .center, spacing: 24) {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Text(title)
                    .fontWeight(.black)
                    .foregroundColor(.black)
                
                Text(description)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 38)
                
                if isLastSlide {
                    ButtonView(
                        label: "Get Started",
                        textColor: .white,
                        textSize: 16,
                        backgroundColor: .violet600,
                        dropShadowColor: .violet700,
                        action: buttonAction,
                        disabled: false,
                        hasIcon: false,
                        iconName: ""
                    )
                    .padding(.vertical, 20)
                } else {
                    ButtonView(
                        label: "➜",
                        textColor: .white,
                        textSize: 16,
                        backgroundColor: .black,
                        dropShadowColor: .slate600,
                        action: buttonAction,
                        disabled: false,
                        hasIcon: false,
                        iconName: ""
                    )
                    .padding(.vertical, 20)
                }
            }
        }
    }
}

#Preview {
    OnboardingSlideView(
        image: "plus", title: "Title",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        buttonAction: {},
        isLastSlide: true
    )
}
