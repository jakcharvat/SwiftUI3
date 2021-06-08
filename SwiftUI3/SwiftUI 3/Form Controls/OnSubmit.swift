//
//  OnSubmit.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI

struct OnSubmit: View {
    @State private var username = ""
    @State private var password = ""
    
    @State private var isAuthenticated = false
    
    var body: some View {
        Form {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            
            if (isAuthenticated) {
                Text("U are logged in 🎉")
                    .font(.headline)
            }
        }
        .onSubmit {
            guard !username.isEmpty && !password.isEmpty else { return }
            print("Authenticating...")
            isAuthenticated = true
        }
    }
}

struct OnSubmit_Previews: PreviewProvider {
    static var previews: some View {
        OnSubmit()
    }
}
