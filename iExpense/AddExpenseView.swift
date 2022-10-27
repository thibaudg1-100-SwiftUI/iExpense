//
//  AddExeoense.swift
//  iExpense
//
//  Created by RqwerKnot on 14/01/2022.
//

import SwiftUI

struct AddExpenseView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var textFieldIsFocused: Bool
    
    @ObservedObject var expenses: Expenses
    
    let localeCurrency: FloatingPointFormatStyle<Double>.Currency
    
    @State private var name: String = ""
    @State private var type: String = "Personal"
    @State private var amount: Double = 0.0
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationView{
            Form{
                
                TextField("Name of expense", text: $name)
                    .focused($textFieldIsFocused)
                
                Picker("Type of expense", selection: $type) {
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: localeCurrency)
                    .keyboardType(.decimalPad)
                    .focused($textFieldIsFocused)
                
            }
            .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem {
                    Button("Save"){
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                        
                        dismiss()
                    }
                }
                ToolbarItem(placement: .keyboard) {
                    Button("Done"){
                        textFieldIsFocused = false
                    }
                }
                
            }
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenses: Expenses(), localeCurrency: .currency(code: Locale.current.currencyCode ?? "USD"))
    }
}
