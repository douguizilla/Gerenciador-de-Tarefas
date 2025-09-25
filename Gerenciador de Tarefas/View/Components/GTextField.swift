//
//  GTextField.swift
//  Gerenciador de Tarefas
//
//  Created by Douglas Gomes on 25/09/25.
//

import SwiftUI

struct GTextField : View {
    var title: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
            
            TextField(placeholder, text: $text)
                .padding(.vertical, 12)
                .padding(.horizontal, 15)
                .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 1)), in: .rect(cornerRadius: 10))
        }
        .padding(.top, 5)
    }
}
