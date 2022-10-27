//
//  Sheets.swift
//  iExpense
//
//  Created by RqwerKnot on 13/01/2022.
//

import SwiftUI

struct Sheets: View {
    
    @State private var showSheet = false
    
    var body: some View {
        Button("Open a sheet"){
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            SecondView(name: "Bilbo Baggins")
        }
    }
}

struct SecondView: View{
    
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View{
        Text("This is a sheet view for \(name)")
        Text("Drag it down to dismiss")
        Text("Or press the button:")
        Button("Dismiss the sheet view"){
            dismiss()
        }
    }
}

struct Sheets_Previews: PreviewProvider {
    static var previews: some View {
        Sheets()
    }
}
