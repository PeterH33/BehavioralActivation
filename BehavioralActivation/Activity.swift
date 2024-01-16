//
//  Activity.swift
//  BehavioralActivation
//
//  Created by Peter Hartnett on 1/16/24.
//

import Foundation
import SwiftData

@Model
class Activity{
    var id: UUID
    var title: String
    var detail: String
    
    init(title: String, detail: String){
        self.detail = detail
        self.title = title
        self.id = UUID()
    }
}
