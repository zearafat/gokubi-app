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
    var isFirstSlide: Bool = false
    var isSecondSlide: Bool = false
    var isLastSlide: Bool = false
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack(alignment: .center, spacing: 24) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 340, height: 340)
                
                Text(title)
                    .fontWeight(.black)
                    .foregroundColor(.black)
                
                Text(description)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                if isFirstSlide {
                    ButtonView(
                        label: "➜",
                        textColor: .white,
                        textSize: 16,
                        backgroundColor: .sky400,
                        dropShadowColor: .sky600,
                        action: buttonAction,
                        disabled: false,
                        hasIcon: false,
                        iconName: ""
                    )
                    .padding(24)
                } else if isSecondSlide {
                    ButtonView(
                        label: "➜",
                        textColor: .white,
                        textSize: 16,
                        backgroundColor: .amber400,
                        dropShadowColor: .amber600,
                        action: buttonAction,
                        disabled: false,
                        hasIcon: false,
                        iconName: ""
                    )
                    .padding(24)
                } else if isLastSlide {
                    ButtonView(
                        label: "Start your Adventure",
                        textColor: .white,
                        textSize: 16,
                        backgroundColor: .violet600,
                        dropShadowColor: .violet700,
                        action: buttonAction,
                        disabled: false,
                        hasIcon: false,
                        iconName: ""
                    )
                    .padding(24)
                }
            }
            .fontDesign(.rounded)
        }
    }
}

#Preview {
    OnboardingSlideView(
        image: "onboarding1", title: "Title",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        buttonAction: {},
        isLastSlide: true
    )
}
