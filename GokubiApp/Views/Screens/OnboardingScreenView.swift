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
                            image: "plus", title: "Title",
                            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            buttonAction: {
                                withAnimation {
                                    currentTab += 1
                                }
                            },
                            isLastSlide: false
                        ).tag(0)
                        OnboardingSlideView(
                            image: "plus", title: "Title 2",
                            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            buttonAction: {
                                withAnimation {
                                    currentTab += 1
                                }
                            },
                            isLastSlide: false
                        ).tag(1)
                        OnboardingSlideView(
                            image: "plus", title: "Title 3",
                            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
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
                    .ignoresSafeArea(.all)
                    .padding(16)
                }
            }
        }
}

#Preview {
    OnboardingScreenView()
}
