//
//  TaskRowView.swift
//  Gerenciador de Tarefas
//
//  Created by Douglas Gomes on 24/09/25.
//

import SwiftUI
import SwiftData

struct TaskRowView: View {
    @Bindable var task: Task
    @Environment(\.modelContext) private var context
    
    var body: some View {
        HStack(alignment: .top, spacing: 15){
            Circle()
                .fill(indicatorColor)
                .frame(width: 10, height: 10)
                .padding(4)
                .background(
                    .white.shadow(.drop(color: .black.opacity(0.1), radius: 3)),
                    in: .circle
                )
                .overlay {
                    Circle()
                        .frame(width: 50, height: 50)
                        .blendMode(.destinationOver)
                        .onTapGesture {
                            task.isCompleted.toggle()
                        }
                }
            
            VStack(alignment: .leading, spacing: 8){
                Text(task.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                
                Label(task.creationDate.format("hh:mm a"), systemImage: "clock")
                    .font(.caption)
                    .foregroundStyle(.black)
            }
            .padding(15)
            .hSpacing(.leading)
            .background(
                task.tintColor.opacity(0.3),
                in: .rect(
                    topLeadingRadius: 15,
                    bottomLeadingRadius: 15
                )
            )
            .strikethrough(task.isCompleted, pattern: .solid, color: .black)
            .contentShape(
                .contextMenuPreview,
                .rect(cornerRadius: 15)
            )
            .contextMenu{
                Button("Delete task", role: .destructive){
                    do{
                        context.delete(task)
                        try context.save()
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
            .offset(y: -8)
        }
    }
    
    var indicatorColor: Color {
        if task.isCompleted {
            return .green
        }
        return task.creationDate.isSameHour ? .blue : (task.creationDate.isPast ? .red : .black)
    }
}

#Preview {
    ContentView()
}
