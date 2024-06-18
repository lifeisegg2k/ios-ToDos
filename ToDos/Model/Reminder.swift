//
//  Reminder.swift
//  ToDos
//
//  Created by yuchul Kim on 2024/06/18.
//

import Foundation
import SwiftData

@Model
final class Reminder {
    var name: String
    var isCompleted = false
    
    init(name: String, isCompleted: Bool = false) {
        self.name = name
        self.isCompleted = isCompleted
    }
}
