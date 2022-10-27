//
//  ContentView.swift
//  iExpense
//
//  Created by RqwerKnot on 13/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    @State private var showAddExpense = false
    
    let localeCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
    
    var body: some View {
        NavigationView {
            List{
                Section("Personal") {
                    ForEach(expenses.personalItems) { item in
                        
                        
                            HStack {
                                VStack(alignment: .leading){
                                    Text(item.name)
                                        .font(.headline)
                                        
                                    
                                    Text(item.type)
                                        .font(.subheadline)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: localeCurrency)
                                    .foregroundColor( item.amount > 100 ? .red : .primary)
                                    .font( item.amount < 10 ? .caption : .body)
                            }
                            // for challenge on accessibility:
                            .accessibilityElement(children: .ignore)
                            .accessibilityLabel("\(item.name), \(item.amount, format: localeCurrency)")
                            .accessibilityHint("\(item.type)")
                        
                        
                    }
                    .onDelete(perform: removePersonalItems)
                }
                
                Section("Business") {
                    ForEach(expenses.businessItems) { item in
                        
                        
                            HStack{
                                VStack(alignment: .leading){
                                    Text(item.name)
                                        .font(.headline)
                                        
                                    
                                    Text(item.type)
                                        .font(.subheadline)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: localeCurrency)
                                    .foregroundColor( item.amount > 100 ? .red : .primary)
                                    .font( item.amount < 10 ? .caption : .body)
                            }
                        
                        
                    }
                    .onDelete(perform: removeBusinessItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button{
                    showAddExpense.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showAddExpense) {
            AddExpenseView(expenses: expenses, localeCurrency: localeCurrency)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        var IDs = [UUID]()
        for index in offsets {
            IDs.append(expenses.personalItems[index].id)
        }
        for (index, item) in expenses.items.enumerated() {
            if IDs.contains(item.id){
                expenses.items.remove(at: index)
            }
        }
        
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        var IDs = [UUID]()
        for index in offsets {
            IDs.append(expenses.businessItems[index].id)
        }
        for (index, item) in expenses.items.enumerated() {
            if IDs.contains(item.id){
                expenses.items.remove(at: index)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}
