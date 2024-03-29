//
//  CreateActivityView.swift
//  BehavioralActivation
//
//  Created by Peter Hartnett on 1/16/24.
//

import SwiftUI
import SwiftData

struct EditActivityView: View {
    
    @Bindable var activity: Activity
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack{
            TextField("Name", text: $activity.title)
                .accessibilityLabel("activityNameTextField")
                .padding()
            TextField("Details", text: $activity.detail)
                .accessibilityLabel("activityDetailsTextField")
                .padding()
        }
        .navigationBarBackButtonHidden(true)
        
        .toolbar{
            
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    print("✅Custom back action")
                    if activity.title.isEmpty{
                        modelContext.delete(activity)
                    }
                    dismiss()
                } label: {
                    HStack{
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    }
                }
            }
            
//            ToolbarItem{
//                Button{
//                    dismiss()
//                } label: {
//                    Text("Done")
//                }
//                .accessibilityLabel("Done")
//            }
            
        }
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Activity.self, configurations: config)
        let activity = Activity(title: "Test Title", detail: "Test Detail")
        return EditActivityView(activity: activity)
            .modelContainer(container)
    } catch {
        return Text("Dailed to create container: \(error.localizedDescription)")
    }
    
}
