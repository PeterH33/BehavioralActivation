//
//  CreateActivityView.swift
//  BehavioralActivationUITests
//
//  Created by Peter Hartnett on 1/16/24.
//

import SwiftUI

struct ActivityListView: View {
    
    var body: some View {
        NavigationStack{
            Text("Create Activity View")
                .toolbar{
                    ToolbarItem{
                        NavigationLink{
                            CreateActivityView()
                        } label: {
                            Image(systemName: "plus")
                                .accessibilityLabel("createActivityButton")
                        }
                    }
                }
                .navigationDestination(for: Activity.self) { activity in
                    CreateActivityView()
                }
        }
    }
}

#Preview {
    ActivityListView()
}
