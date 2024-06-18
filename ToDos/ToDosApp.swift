//
//  ToDosApp.swift
//  ToDos
//
//  Created by yuchul Kim on 2024/06/18.
//

import SwiftUI
import SwiftData

@main
struct ToDosApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: ReminderList.self)
    }
}
