//
//  CreateActivityView.swift
//  BehavioralActivation
//
//  Created by Peter Hartnett on 1/16/24.
//

import SwiftUI

struct CreateActivityView: View {
    @State private var title: String = ""
    @State private var details: String = ""
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        VStack{
            TextField("Name", text: $title)
                .accessibilityLabel("activityNameTextField")
                .padding()
            TextField("Details", text: $details)
                .accessibilityLabel("activityDetailsTextField")
                .padding()
        }
        .toolbar{
            ToolbarItem{
                Button{
                    modelContext.insert(Activity(title: title, detail: details))
                    dismiss()
                } label: {
                    Text("Done")
                }
                .accessibilityLabel("Done")
            }
        }
    }
}

#Preview {
    CreateActivityView()
}
