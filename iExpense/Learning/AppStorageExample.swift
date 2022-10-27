//
//  AppStorageExample.swift
//  iExpense
//
//  Created by RqwerKnot on 13/01/2022.
//

import SwiftUI

struct AppStorageExample: View {
    
    @AppStorage("tapCount") private var tapCount = 10
    // fetch the value stored in "tapCount" key whose name can be different from property name
    // You can easily set a different default value (not 0) when the app is launched for the very fisrt time
    // But you can't store Swift Struct using @AppStorage

        var body: some View {
            Button("Tap count: \(tapCount)") {
                tapCount += 1
                // You don't need anymore to call UserDefaults.standard
                //
            }
        }
}

struct AppStorageExample_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageExample()
    }
}
