//
//  CreateActivityView.swift
//  BehavioralActivation
//
//  Created by Peter Hartnett on 1/16/24.
//

import SwiftUI

struct CreateActivityView: View {
    @State private var name:String = ""
    var body: some View {
        TextField("Name", text: $name)
            .accessibilityLabel("activityNameTextField")
    }
}

#Preview {
    CreateActivityView()
}
