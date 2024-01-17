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
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack{
            List{
                Section("Activities"){
                    ForEach(activities){ activity in
                        Text(activity.title)
                    }
                    .onDelete(perform: deleteActivity)
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
    
    func deleteActivity(at offsets: IndexSet){
        for offset in offsets{
            let activity = activities[offset]
            modelContext.delete(activity)
        }
    }
}

#Preview {
    ActivityListView()
}
