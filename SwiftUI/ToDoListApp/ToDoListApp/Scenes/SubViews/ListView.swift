//
//  ListView.swift
//  ToDoListApp
//
//  Created by Temur Chitashvili on 25.05.24.
//

import SwiftUI

struct ListView: View {
    @State var tasksArray: [TaskModel] = [
        TaskModel(title: "Mobile App Research", date: "5 Aug", color: .firstCell),
        TaskModel(title: "Prepare Wireframe for Main Flow", date: "5 Aug", color: .secondCell),
        TaskModel(title: "Prepare Screens", date: "5 Aug" , color: .thirdCell),
        TaskModel(title: "Website Research", date: "5 Aug", color: .firstCell),
        TaskModel(title: "Prepare Wireframe for Main Flow", date: "5 Aug", color: .secondCell),
        TaskModel(title: "Prepare Screens", date: "5 Aug", color: .thirdCell),
    ]
    @State private var strokeColors: [UUID: Color] = [:]
    @State private var backgroundColors: [UUID: Color] = [:]
    @State private var checkMarkHideDic: [UUID: Bool] = [:]
    @State private var checkMarkTappedDic: [UUID: Bool] = [:]
    @Binding var isAllTaskCompleted: Bool
    @Binding var completedCounter: CGFloat
    @Binding var incompletedCounter: CGFloat
    @Binding var percent: CGFloat
    var body: some View {
        VStack {
            HStack() {
                Text("Tasks")
                    .font(.system(size: 22, weight: .regular))
                    .foregroundColor(.darkModeLabel)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
            
            List (tasksArray) { task in
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 350, height: 80)
                        .foregroundColor(.progressViewRectangle)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    HStack {
                        UnevenRoundedRectangle(topLeadingRadius: 8, bottomLeadingRadius: 8)
                            .fill(task.color)
                            .frame(width: 15, height: 80)
                        
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.darkModeLabel)
                            
                            HStackLayout(spacing: 7) {
                                Image(systemName: "calendar")
                                Text(task.date)
                            }
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.darkModeLabel).opacity(0.8)
                        }
                        .padding(EdgeInsets(top: 0, leading: 28, bottom: 20, trailing: 0))
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        HStack(alignment: .center) {
                            Circle()
                                .stroke(lineWidth: 3)
                                .frame(width: 26, height: 26)
                                .foregroundColor(strokeColors[task.id, default: .progress])
                                .background(
                                    backgroundColors[task.id, default: .clear]
                                    
                                )
                                .cornerRadius(13)
                                .overlay {
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .imageIsHidden(id: task.id, isbuttonTapped: $checkMarkHideDic)
                                        .frame(width: 11.05, height: 7.36)
                                }
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 11))
                        }
                        .contentShape(Circle())
                        .onTapGesture {
                            toggleTaskCompletion(task)
                        }
                    }
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .onChange(of: isAllTaskCompleted, { oldValue, newValue in
                    if newValue {
                        isAllTaskCompleted = false
                        completeAllTasks()
                    }
                })
            }
            .frame(width: 420, height: 450)
        }
    }
    private func toggleTaskCompletion(_ task: TaskModel) {
        if checkMarkTappedDic[task.id] == nil {
            checkMarkTappedDic[task.id] = false
        }
        guard let unwrappedBool = checkMarkTappedDic[task.id] else { return }
        if unwrappedBool {
            guard let index = tasksArray.firstIndex(where: { $0.id == task.id }) else { return }
            let removedTask = tasksArray.remove(at: index)
            strokeColors[task.id] = .progress
            backgroundColors[task.id] = .clear
            checkMarkHideDic[task.id] = true
            completedCounter -= 1
            incompletedCounter = CGFloat(tasksArray.count) + 1 - completedCounter
            percent = completedCounter / CGFloat(tasksArray.count + 1) * 100
            tasksArray.append(removedTask)
            checkMarkTappedDic[task.id]?.toggle()
        } else {
            guard let index = tasksArray.firstIndex(where: { $0.id == task.id }) else { return }
            let removedTask = tasksArray.remove(at: index)
            strokeColors[task.id] = .darkModeLabel
            backgroundColors[task.id] = .progress
            checkMarkHideDic[task.id] = false
            completedCounter += 1
            incompletedCounter = CGFloat(tasksArray.count) + 1 - completedCounter
            percent = completedCounter / CGFloat(tasksArray.count + 1) * 100
            tasksArray.insert(removedTask, at: 0)
            checkMarkTappedDic[task.id]?.toggle()
        }
    }
    
    private func completeAllTasks() {
        for task in tasksArray {
            checkMarkTappedDic[task.id] = true
            strokeColors[task.id] = .darkModeLabel
            backgroundColors[task.id] = .progress
            checkMarkHideDic[task.id] = false
        }
        completedCounter = CGFloat(tasksArray.count)
        incompletedCounter = 0
        percent = 100
    }
}

struct MyImage: ViewModifier {
    var id: UUID
    @Binding var buttonTapped: [UUID: Bool]
    func body(content: Content) -> some View {
        if buttonTapped[id] ?? true {
            content
                .hidden()
        } else {
            content
        }
    }
}

extension Image {
    func imageIsHidden(id: UUID, isbuttonTapped: Binding<[UUID: Bool]>) -> some View {
        return modifier(MyImage(id: id, buttonTapped: isbuttonTapped))
    }
}

#Preview {
    ContentView()
}
