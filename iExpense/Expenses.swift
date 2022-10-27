//
//  Expenses.swift
//  iExpense
//
//  Created by RqwerKnot on 13/01/2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    // Computed property that returns Items whose category is Personal
    var personalItems: [ExpenseItem] {
        var personal = [ExpenseItem]()
        for item in items {
            if item.type == "Personal" {
                personal.append(item)
            }
        }
        return personal
    }
    
    // Computed property that returns Items whose category is Business
    var businessItems: [ExpenseItem] {
        var business = [ExpenseItem]()
        for item in items {
            if item.type == "Business" {
                business.append(item)
            }
        }
        return business
    }
    
    init() {
        
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded =  try? decoder.decode([ExpenseItem].self, from: savedItems){
                items = decoded
                return
            }
        }
        items = []
    }
}
