//
//  UserDefaults.swift
//  iExpense
//
//  Created by RqwerKnot on 13/01/2022.
//

import SwiftUI

struct UserDefaultsExample: View {
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        Button("Tap me: \(tapCount)") {
            tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
            
        }
    }
}

struct UserDefaults_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsExample()
    }
}
