//
//  Task.swift
//  Gerenciador de Tarefas
//
//  Created by Douglas Gomes on 24/09/25.
//

import SwiftUI
import SwiftData

@Model
class Task: Identifiable {
    var id: UUID
    var title: String
    var creationDate: Date
    var isCompleted: Bool
    var tint: String
    
    init(
        id: UUID = .init(),
        title: String,
        creationDate: Date = .init(),
        isCompleted: Bool = false,
        tint: String
    ) {
        self.id = id
        self.title = title
        self.creationDate = creationDate
        self.isCompleted = isCompleted
        self.tint = tint
    }
    
    var tintColor: Color {
        switch tint {
        case "red":
            return .red
        case "yellow":
            return .yellow
        case "green":
            return .green
        case "blue":
            return .blue
        default:
            return .purple
        }
    }
}

extension Date {
    static func updateHour(_ value: Int) -> Date {
        Calendar.current.date(byAdding: .hour, value: value, to: Date()) ?? Date()
    }
}
