//
//  OnboardingScreenView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 20/12/24.
//

import SwiftUI

struct OnboardingScreenView: View {
    @State private var currentTab: Int = 0
    @State private var showMainApp: Bool = false
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
        
    var body: some View {
        ZStack(alignment: .center) {
            if showMainApp {
                HomeScreenView()
                    .transition(.opacity)
                    .animation(.easeIn(duration: 0.5), value: showMainApp)
            } else {
                TabView(selection: $currentTab, content: {
                    OnboardingSlideView(
                        image: "onboarding01", title: "Record Your Gaming Journey",
                        description: "Keep track of your gaming adventures, add personal notes, and never lose sight of the games you love.",
                        buttonAction: {
                            withAnimation {
                                currentTab += 1
                            }
                        },
                        isFirstSlide: true
                    ).tag(0)
                    OnboardingSlideView(
                        image: "onboarding02", title: "Stay Organized",
                        description: "Log your favorite games, add games, easly find and manage them. It's like a diary but for your games.",
                        buttonAction: {
                            withAnimation {
                                currentTab += 1
                            }
                        },
                        isSecondSlide: true
                    ).tag(1)
                    OnboardingSlideView(
                        image: "onboarding1", title: "Level Up Your Experience",
                        description: "A seamless way to track your progress and organize your favorite games. Start your adventure today!",
                        buttonAction: {
                            withAnimation {
                                showMainApp = true
                                hasSeenOnboarding = true
                            }
                        },
                        isLastSlide: true
                    ).tag(2)
                })
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
        }
    }
}

#Preview {
    OnboardingScreenView()
}
