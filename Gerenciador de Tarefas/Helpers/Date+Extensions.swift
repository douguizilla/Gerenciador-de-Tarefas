//
//  Date+Extensions.swift
//  Gerenciador de Tarefas
//
//  Created by Douglas Gomes on 24/09/25.
//

import SwiftUI

extension Date {
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
    
    func fetchWeek(_ date: Date = .init()) -> [WeekDay] {
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: date)
        
        var week: [WeekDay] = []
        let weekForDate = calendar.dateInterval(of: .weekOfMonth, for: startOfDate)
        guard let startOfWeek = weekForDate?.start else {
            return []
        }
        
        (0..<7).forEach { index in
            if let weekDay = calendar.date(
                byAdding: .day,
                value: index,
                to: startOfWeek
            ){
                week.append(.init(date: weekDay))
            }
        }
        
        return week
    }
    
    struct WeekDay: Identifiable {
        var id: UUID = UUID()
        var date: Date
    }
}
