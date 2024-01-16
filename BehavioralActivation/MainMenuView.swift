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
                    Image(systemName: "person.and.arrow.left.and.arrow.right")
                    Text("Pick Activity")
                        .accessibilityIdentifier("pickActivityNav")
                }
            ActivityListView()
                .tabItem {
                    Image(systemName: "list.bullet.clipboard")
                    Text("Activity List")
                        .accessibilityIdentifier("createActivityNav")
                }
        }
    }
}

#Preview {
    MainMenuView()
}
