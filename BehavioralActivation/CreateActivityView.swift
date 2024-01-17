//
//  CreateActivityView.swift
//  BehavioralActivation
//
//  Created by Peter Hartnett on 1/16/24.
//

import SwiftUI

struct CreateActivityView: View {
    @State private var name: String = ""
    @State private var details: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            TextField("Name", text: $name)
                .accessibilityLabel("activityNameTextField")
                .padding()
            TextField("Details", text: $details)
                .accessibilityLabel("activityDetailsTextField")
                .padding()
        }
        .toolbar{
            ToolbarItem{
                Button{
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
