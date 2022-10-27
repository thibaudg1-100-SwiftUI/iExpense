//
//  ClassUser.swift
//  iExpense
//
//  Created by RqwerKnot on 13/01/2022.
//

import SwiftUI

class User2: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
    
    // @Published tells Swift to send an announcement out to Views using this property to reload
}

struct ClassUser: View {
    
    @StateObject var user = User2()
    // tells Swift that the class instance created has to be watched for any change announcements
    // Only use @StateObject once where created the first time, then use @ObservedObject elsewhere
    
    var body: some View {
            VStack {
                Text("Your name is \(user.firstName) \(user.lastName).")

                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
            }
        }
}

struct ClassUser_Previews: PreviewProvider {
    static var previews: some View {
        ClassUser()
    }
}

