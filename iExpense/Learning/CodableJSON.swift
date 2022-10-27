//
//  CodableJSON.swift
//  iExpense
//
//  Created by RqwerKnot on 13/01/2022.
//

import SwiftUI

// make sure your struct conforms to Codable protocol:
struct User3: Codable {
    let firstName: String
    let lastName: String
}

struct CodableJSON: View {
    
    @State private var user = User3(firstName: "Bob", lastName: "Singer")
    
    var body: some View {
        Button("Save to UserDefaults"){
            // create an instance of Class JSON Encoder:
            let encoder =  JSONEncoder()
            
            // encode user to type Data which is storable then using UserDefaults:
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct CodableJSON_Previews: PreviewProvider {
    static var previews: some View {
        CodableJSON()
    }
}
