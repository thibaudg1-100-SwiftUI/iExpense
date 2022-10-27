//
//  UserStruct.swift
//  iExpense
//
//  Created by RqwerKnot on 13/01/2022.
//

import SwiftUI

struct User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

// Using a Struct works fine if the instance of the User is needed at only one place (one View)
// The instance cannot be shared with other Views, as each View will create its own copy of the instance

struct UserStruct: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            
            // When one edits a name, @State destroys the existing instance of User and creates a new one with new name, and reload the View body
        }
    }
}

struct UserStruct_Previews: PreviewProvider {
    static var previews: some View {
        UserStruct()
    }
}
