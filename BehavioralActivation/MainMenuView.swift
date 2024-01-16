//
//  MainMenuView.swift
//  BehavioralActivation
//
//  Created by Peter Hartnett on 1/16/24.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        TabView{
            Text("Pick Activity View")
                .tabItem {
                    Text("Pick Activity")
                        .accessibilityIdentifier("pickActivityNav")
                }
        }
    }
}

#Preview {
    MainMenuView()
}
