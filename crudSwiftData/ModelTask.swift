//
//  ModelTask.swift
//  crudSwiftData
//
//  Created by Eliardo Venancio on 07/05/25.
//

import Foundation
import SwiftData

@Model
final class ModelTask {
    var titleTask: String
    var descriptionTask: String
    var isCompletedTask: Bool = false
    var createdAt: Date
    
    init(title: String, description: String, isCompleted: Bool = false, createdAt: Date = .now) {
        self.titleTask = title
        self.descriptionTask = description
        self.isCompletedTask = isCompleted
        self.createdAt = createdAt
    }
}
