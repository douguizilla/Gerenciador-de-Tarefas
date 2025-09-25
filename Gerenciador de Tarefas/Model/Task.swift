//
//  Task.swift
//  Gerenciador de Tarefas
//
//  Created by Douglas Gomes on 24/09/25.
//

import SwiftUI

struct Task: Identifiable {
    var id: UUID = UUID()
    var title: String
    var creationDate: Date = Date()
    var isCompleted: Bool = false
    var tint: Color
}

var sampleTasks: [Task] = [
    .init(title: "Estudar SwiftUI", creationDate: .updateHour(-5), isCompleted: true, tint: .blue),
    .init(title: "Fazer exercícios de matemática", creationDate: .updateHour(-3), isCompleted: false, tint: .red),
    .init(title: "Comprar leite", creationDate: .updateHour(-4), isCompleted: false, tint: .yellow),
    .init(title: "Ver filme", creationDate: .updateHour(0), isCompleted: true, tint: .green),
    .init(title: "Passear com o cão", creationDate: .updateHour(2), isCompleted: false, tint: .purple),
    .init(title: "Estudar inglês", creationDate: .updateHour(1), isCompleted: true, tint: .orange),
    .init(title: "Fazer compras", creationDate: .updateHour(3), isCompleted: false, tint: .pink),
]

extension Date {
    static func updateHour(_ value: Int) -> Date {
        Calendar.current.date(byAdding: .hour, value: value, to: Date()) ?? Date()
    }
}
