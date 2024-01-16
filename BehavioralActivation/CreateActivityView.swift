//
//  CreateActivityView.swift
//  BehavioralActivationUITests
//
//  Created by Peter Hartnett on 1/16/24.
//

import SwiftUI

struct CreateActivityView: View {
    var body: some View {
        NavigationStack{
            Text("Create Activity View")
                .toolbar{
                    ToolbarItem{
                        Button{
                            _ = 1
                        } label: {
                            Image(systemName: "plus")
                                .accessibilityLabel("createActivityButton")
                        }
                    }
                }
        }
    }
}

#Preview {
    CreateActivityView()
}
