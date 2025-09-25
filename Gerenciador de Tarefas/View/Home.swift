//
//  Home.swift
//  Gerenciador de Tarefas
//
//  Created by Douglas Gomes on 24/09/25.
//

import SwiftUI

struct Home: View {
    @State private var currentDate: Date = Date()
    @State private var weekSlider: [[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 0
    
    @Namespace private var animation

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView()
            
        }
        .vSpacing(.top)
        .onAppear{
            if weekSlider.isEmpty {
                let currentWeek = Date().fetchWeek()
                weekSlider.append(currentWeek)
            }
        }
    }
    
    @ViewBuilder
    private func HeaderView() -> some View {
        VStack(alignment: .leading, spacing: 6){
            HStack(spacing: 5) {
                Text(currentDate.format("MMMM"))
                    .foregroundStyle(.blue)
                
                Text(currentDate.format("YYYY"))
                    .foregroundStyle(.black.opacity(0.5))
            }
            .font(.title.bold())
            
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .textScale(.secondary)
                .foregroundStyle(.gray)
            
            TabView(selection: $currentWeekIndex) {
                ForEach(weekSlider.indices, id: \.self){ index in
                    let week = weekSlider[index]
                    WeekView(week)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 90)
        }
        .hSpacing(.leading)
        .overlay(alignment: .topTrailing){
            Button(action: {}) {
                Image(.pic)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(.circle)
            }
        }
        .padding()
        .background(.white)
    }
    
    @ViewBuilder
    func WeekView(_ week: [Date.WeekDay]) -> some View {
        HStack(spacing: 0) {
            ForEach(week){ day in
                VStack(spacing: 8) {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)
                    
                    Text(day.date.format("dd"))
                        .font(.callout)
                        .fontWeight(.bold)
                        .textScale(.secondary)
                        .foregroundStyle(
                            isSameDate(day.date, currentDate) ? .white : .gray
                        )
                        .frame(width: 35, height: 35)
                        .background{
                            if isSameDate(day.date, currentDate){
                                Circle()
                                    .fill(.blue)
                                    .matchedGeometryEffect(id: "TABINDICATOR", in: animation)
                            }
                            
                            if day.date.isToday {
                                Circle()
                                    .fill(.cyan)
                                    .frame(width: 5, height: 5)
                                    .vSpacing(.bottom)
                                    .offset(y: 12)
                            }
                        }
                        .background(
                            .white.shadow(.drop(radius: 1)), in: .circle
                        )
                        
                }
                .hSpacing(.center)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy){
                        currentDate = day.date
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
