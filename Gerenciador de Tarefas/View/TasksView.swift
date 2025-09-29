//
//  TasksView.swift
//  Gerenciador de Tarefas
//
//  Created by Douglas Gomes on 28/09/25.
//

import SwiftUI
import SwiftData

struct TasksView: View {
    @Binding var currentDate: Date
    @Query private var tasks: [Task]
    
    init(currentDate: Binding<Date>) {
        self._currentDate = currentDate
        let startOfDate = Calendar.current.startOfDay(for: currentDate.wrappedValue)
        let endOfDate = Calendar.current.date(byAdding: .day, value: 1, to: startOfDate)!
        let predicate = #Predicate<Task> {
            return $0.creationDate >= startOfDate && $0.creationDate < endOfDate
        }
        let sortDescriptor = [
            SortDescriptor(\Task.creationDate, order: .reverse)
        ]
        self._tasks = Query(filter: predicate, sort: sortDescriptor, animation: .snappy)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            ForEach(tasks){ task in
                TaskRowView(task: task)
                    .background(alignment: .leading) {
                        if tasks.last?.id != task.id {
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 8)
                                .padding(.bottom, -35)
                            
                        }
                    }
            }
        }
        .padding([.vertical, .leading], 15)
        .padding(.top, 15)
    }
}

