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
            PickActivityView()
                .tabItem {
                    Image(systemName: "list.bullet.clipboard")
                    Text("Pick Activity")
                        .accessibilityIdentifier("pickActivityNav")
                }
            Text("Create Activity View")
                .tabItem {
                    Image(systemName: "plus.app")
                    Text("create Activity")
                        .accessibilityIdentifier("createActivityNav")
                }
        }
    }
}

#Preview {
    MainMenuView()
}
