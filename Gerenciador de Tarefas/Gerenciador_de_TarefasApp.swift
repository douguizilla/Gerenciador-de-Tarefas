//
//  Gerenciador_de_TarefasApp.swift
//  Gerenciador de Tarefas
//
//  Created by Douglas Gomes on 24/09/25.
//

import SwiftUI
import SwiftData

@main
struct Gerenciador_de_TarefasApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
