//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Temur Chitashvili on 23.05.24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkMarkTapped = true
    var body: some View {
        ZStack {
            VStack {
                HeaderView()
                ScrollView {
                    ProgressBar()
                        .frame(width: 380, height: 139)
                        .padding(EdgeInsets(top: 19, leading: 16, bottom: 0, trailing: 16))
                    ListView(checkMarkTapped: $checkMarkTapped)
                        .frame(width: 400)
                        .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                }
            }
        }
    }
}



struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("You have 3 tasks to complete")
                    .frame(width: 190, height: 60)
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(.darkModeLabel)
                
                Spacer()
                
                ZStack {
                    Image(.profile)
                        .resizable()
                        .frame(width: 45, height: 45)
                        .scaledToFill()
                        .cornerRadius(22.5)
                        .overlay(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                            Circle()
                                .overlay(content: {
                                    Text("3")
                                        .font(.system(size: 9, weight: .regular))
                                        .foregroundColor(.white)
                                })
                                .frame(width: 15, height: 15)
                                .foregroundColor(.notfCircle)
                        })
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 22))
                }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                
            Button(action: {

            }, label: {
                    Text("Complete All")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                })
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(
                LinearGradient(gradient: Gradient(colors: [.buttonColorStart, .buttonColorEnd]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(8)
            .padding(EdgeInsets(top: 37, leading: 16, bottom: 0, trailing: 16))
        }
    }
}

struct ProgressBar: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Progress")
                    .frame(width: 85, height: 20)
                    .foregroundColor(.darkModeLabel)
                
                Spacer()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.progressViewRectangle)
                
                HStack {
                    VStack(alignment: .leading,spacing: 10) {
                        Text("Daily Task")
                            .foregroundColor(.darkModeLabel)
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("3/6 Task Completed")
                            .foregroundColor(.darkModeLabel).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Keep Working")
                            .foregroundColor(.darkModeLabel).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 14, weight: .ultraLight))
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 1)
                                .frame(maxWidth: .infinity, maxHeight: 20)
                                .background(Color.progress).opacity(0.41)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150, height: 20)
                                .background(
                                    Color.progress
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                )
                                .foregroundColor(.clear)
                        }
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 15, leading: 16, bottom: 0, trailing: 10))
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("50%")
                        .foregroundColor(.darkModeLabel)
                        .font(.system(size: 18, weight: .regular))
                }
                .padding(EdgeInsets(top: 33, leading: 0, bottom: 0, trailing: 32))
            }
        }
    }
}


struct ListView: View {
    let tasksArray: [TaskModel] = [
        TaskModel(title: "Mobile App Research", date: "5 Aug", color: .firstCell),
        TaskModel(title: "Prepare Wireframe for Main Flow", date: "5 Aug", color: .secondCell),
        TaskModel(title: "Prepare Screens", date: "5 Aug", color: .thirdCell),
        TaskModel(title: "Website Research", date: "5 Aug", color: .firstCell),
        TaskModel(title: "Prepare Wireframe for Main Flow", date: "5 Aug", color: .secondCell),
        TaskModel(title: "Prepare Screens", date: "5 Aug", color: .thirdCell),
    ]
    @State private var strokeColors: [UUID: Color] = [:]
    @State private var backgroundColors: [UUID: Color] = [:]
    @Binding var checkMarkTapped: Bool
    @State private var checkMarkTappedDic: [UUID: Bool] = [:]
    var body: some View {
        VStack {
            HStack() {
                Text("Completed Tasks")
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
                                        .imageIsHidden(id: task.id, isbuttonTapped: $checkMarkTappedDic)
                                        .frame(width: 11.05, height: 7.36)
                                }
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 11))
                        }
                        .contentShape(Circle())
                        .onTapGesture {
                                if !checkMarkTapped {
                                    strokeColors[task.id] = .progress
                                    backgroundColors[task.id] = .clear
                                    checkMarkTapped = true
                                    checkMarkTappedDic[task.id] = true
                                } else {
                                    strokeColors[task.id] = .darkModeLabel
                                    backgroundColors[task.id] = .progress
                                    checkMarkTapped = false
                                    checkMarkTappedDic[task.id] = false
                            }
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
        }
        .frame(width: 440, height: 450)
        .scrollContentBackground(.hidden)
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
