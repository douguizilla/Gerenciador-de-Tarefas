//
//  ContentView.swift
//  Gerenciador de Tarefas
//
//  Created by Douglas Gomes on 24/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray.opacity(0.2))
            .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
