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
    var id: UUID = UUID()
    var title: String
    var creationDate: Date = Date()
    var isCompleted: Bool = false
    var tint: Color
    
    init(
        id: UUID = .init(),
        title: String,
        creationDate: Date = .init(),
        isCompleted: Bool = false,
        tint: Color
    ) {
        self.id = id
        self.title = title
        self.creationDate = creationDate
        self.isCompleted = isCompleted
        self.tint = tint
    }
}

extension Date {
    static func updateHour(_ value: Int) -> Date {
        Calendar.current.date(byAdding: .hour, value: value, to: Date()) ?? Date()
    }
}
