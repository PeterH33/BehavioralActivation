//
//  CreateActivityView.swift
//  BehavioralActivationUITests
//
//  Created by Peter Hartnett on 1/16/24.
//

import SwiftUI
import SwiftData

struct ActivityListView: View {
    @Query private var activities: [Activity]
    
    var body: some View {
        NavigationStack{
            List{
                Section("Activities"){
                    ForEach(activities){ activity in
                        Text(activity.title)
                    }
                }
            }
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
