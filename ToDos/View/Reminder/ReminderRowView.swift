//
//  ReminderRowView.swift
//  ToDos
//
//  Created by yuchul Kim on 2024/06/18.
//

import SwiftUI
import SwiftData

struct ReminderRowView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var reminder: Reminder
    
    var body: some View {
        HStack {
            Button {
                reminder.isCompleted.toggle()
            } label: {
                if reminder.isCompleted {
                    filledRemainderLabel
                } else {
                    emptyReminderLabel
                }
            }
            .frame(width: 20, height: 20)
            .buttonStyle(.plain)
            
            TextField(reminder.name, text: $reminder.name)
                .foregroundColor(reminder.isCompleted ? .secondary : .primary)
        }
    }
    
    var filledRemainderLabel: some View {
        Circle()
            .stroke(.primary, lineWidth: 2)
            .overlay(alignment: .center) {
                GeometryReader { geo in
                    VStack {
                        Circle()
                            .fill(.primary)
                            .frame(
                                width: geo.size.width * 0.7,
                                height: geo.size.height * 0.7,
                                alignment: .center
                            )
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
    }
    
    var emptyReminderLabel: some View {
        Circle()
            .stroke(.secondary)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Reminder.self, configurations: config)
        let example = Reminder(
            name: "Lunch with Janet",
            isCompleted: false
        )
        
        return ReminderRowView(reminder: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
