//
//  ListProjectMVVMApp.swift
//  ListProjectMVVM
//
//  Created by Bárbara Araújo Paim  on 08/03/22.
//

import SwiftUI

@main
struct ListProjectMVVMApp: App {
    @StateObject var todoManager = TodoListManager()
    var body: some Scene {
        WindowGroup {
            TodoListView(todoManager: todoManager)
        }
    }
}
