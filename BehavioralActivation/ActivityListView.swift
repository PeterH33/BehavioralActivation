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
    
    @State private var path = [Activity]()
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack(path: $path){
            List{
                Section("Activities"){
                    ForEach(activities){ activity in
                        Text(activity.title)
                            .swipeActions(edge: .leading, allowsFullSwipe: true){
                                Button{
                                    path.append(activity)
                                } label: {
                                    Label("Edit", systemImage: "square.and.pencil")
                                }
                                .tint(.yellow)
                            }
//                        NavigationLink(activity.title, value: activity)
                    }
                    .onDelete(perform: deleteActivity)
                }
            }
            
            .toolbar{
                ToolbarItem{
                    Button{
                        let blankActivity = Activity(title: "", detail: "")
                        modelContext.insert(blankActivity)
                        path = [blankActivity]
                    } label: {
                        Image(systemName: "plus")
                            .accessibilityLabel("createActivityButton")
                    }
                }
            }
            .navigationDestination(for: Activity.self) { activity in
                EditActivityView(activity: activity)
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
