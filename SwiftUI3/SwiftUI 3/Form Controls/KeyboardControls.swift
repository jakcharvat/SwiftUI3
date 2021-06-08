//
//  KeyboardControls.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI

struct KeyboardControls: View {
    @State private var name = ""
    @FocusState private var nameIsFocused: Bool
    
    
    enum FormField {
        case firstName
        case lastName
        case emailAddress
    }
    
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var emailAddress = ""
    @FocusState private var focusedField: FormField?

    var body: some View {
        Form {
            Section("Basics") {
                TextField("Enter your name", text: $name)
                    .focused($nameIsFocused)
                
                Button("Submit") {
                    nameIsFocused = false
                }
            }
            
            
            Section("More complex flows") {
                TextField("Enter your first name", text: $firstName)
                    .focused($focusedField, equals: .firstName)
                    .textContentType(.givenName)
                    .submitLabel(.next)
                
                
                TextField("Enter your last name", text: $lastName)
                    .focused($focusedField, equals: .lastName)
                    .textContentType(.givenName)
                    .submitLabel(.next)
                
                
                TextField("Enter your email address", text: $emailAddress)
                    .focused($focusedField, equals: .emailAddress)
                    .textContentType(.emailAddress)
                    .submitLabel(.join)
            }
        }
        .onSubmit {
            switch focusedField {
            case .firstName:
                focusedField = .lastName
            case .lastName:
                focusedField = .emailAddress
            case .emailAddress:
                print("Joining chat room...")
            default: break
            }
        }
    }
}

struct KeyboardControls_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardControls()
    }
}
