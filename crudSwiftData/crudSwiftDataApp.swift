//
//  crudSwiftDataApp.swift
//  crudSwiftData
//
//  Created by Eliardo Venancio on 07/05/25.
//

import SwiftUI
import SwiftData

@main
struct crudSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ModelTask.self)
    }
}
