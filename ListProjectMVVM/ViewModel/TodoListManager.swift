//
//  TodoListManager.swift
//  ListProjectMVVM
//
//  Created by Bárbara Araújo Paim  on 08/03/22.
//

import Foundation

class TodoListManager: ObservableObject {
    @Published var items: [Item] = []
    
    init(isForTest: Bool = false) {
        if isForTest {
            //get my data and set to my items array
        }
    }
    
    
    func move(indices: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func addItem () {
        items.append(Item(id: UUID(), name: "newly added"))
    }
    func delete (at indexSet: IndexSet) {
        for index in indexSet {
            items.remove(at: index)
        }
    }
    
    static func emptyState() -> TodoListManager {
        let manager = TodoListManager(isForTest: true)
        manager.items = []
        return manager
    }
    static func fullState() -> TodoListManager {
        let manager = TodoListManager(isForTest: true)
        manager.items = [Item(id: UUID(), name: "First"),Item(id: UUID(), name: "Secoond"),Item(id: UUID(), name: "Third")]
        return manager
    }
}
