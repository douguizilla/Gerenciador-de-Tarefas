//
//  NewTaskView.swift
//  Gerenciador de Tarefas
//
//  Created by Douglas Gomes on 25/09/25.
//

import SwiftUI
import SwiftData

struct NewTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var taskTitle: String = ""
    @State private var taskDate: Date = .init()
    @State private var taskColor: Color = .red
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button(action: { dismiss() }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(.red)
            }
            .hSpacing(.leading)
            
            GTextField(
                title: "Task Title",
                placeholder: "Go for a Walk!",
                text: $taskTitle
            )
            
            HStack(spacing: 12){
                VStack(alignment: .leading, spacing: 8) {
                    Text("Task Date")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    DatePicker("", selection: $taskDate)
                        .datePickerStyle(.compact)
                        .scaleEffect(0.9, anchor: .leading)
                }
                .padding(.top, 5)
                .padding(.trailing, -15)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Task Color")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    let colors : [Color] = [.red, .yellow, .green, .blue, .purple]
                    
                    HStack(spacing: 0) {
                        ForEach(colors, id: \.self) { color in
                            Button(action: { self.taskColor = color }) {
                                Circle()
                                    .fill(color.opacity(0.3))
                                    .frame(width: 20, height: 20)
                                    .background{
                                        Circle()
                                            .stroke(lineWidth: 2)
                                            .opacity(taskColor == color ? 1 : 0)
                                    }
                                    .hSpacing(.center)
                                    .onTapGesture {
                                        withAnimation(.snappy) {
                                            taskColor = color
                                        }
                                    }
                            }
                        }
                    }
                }
                .padding(.top, 5)
            }
            
            Spacer(minLength: 0)
            
            Button{
                let task = Task(
                    title: taskTitle,
                    creationDate: taskDate,
                    tint: getStringColor(color: taskColor)
                )
                do{
                    context.insert(task)
                    try context.save()
                    dismiss()
                }catch{
                    print(error.localizedDescription)
                }
            }label: {
                Text("Create Task")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .textScale(.secondary)
                    .foregroundStyle(.black.opacity(0.8))
                    .hSpacing(.center)
                    .padding(.vertical, 12)
                    .background(taskColor.opacity(0.3), in: .rect(cornerRadius: 10))
            }
            .disabled(taskTitle == "")
            .opacity(taskTitle == "" ? 0.5 : 1)
        }
        .padding(15)
    }
    
    private func getStringColor(color: Color) -> String {
        switch color {
        case .red: return "red"
        case .yellow: return "yellow"
        case .green: return "green"
        case .blue: return "blue"
        case .purple: return "purple"
        default: return "black"
        }
    }
}

#Preview {
    NewTaskView()
}
