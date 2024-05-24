//
//  TaskModel.swift
//  ToDoListApp
//
//  Created by Temur Chitashvili on 24.05.24.
//

import SwiftUI


struct TaskModel: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let color: Color
}

