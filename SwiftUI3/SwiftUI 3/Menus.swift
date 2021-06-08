//
//  Menus.swift
//  iOS 15 Test
//
//  Created by Jakub Charvat on 08.06.2021.
//

import SwiftUI

struct Menus: View {
    @State private var alertMessage: String?
    
    var body: some View {
        Menu("Cart") {
            Button("Order Now", action: placeOrder)
            Button("Adjust Order", action: adjustOrder)
            Button("Cancel Order", action: cancelOrder)
        } primaryAction: {
            viewCart()
        }
        .alert(alertMessage ?? "", isPresented: showingAlert) { }
    }
    
    var showingAlert: Binding<Bool> {
        Binding {
            alertMessage != nil
        } set: { isShown in
            if !isShown { alertMessage = nil }
        }
    }
    
    
    func placeOrder() {
        alertMessage = "Placed order"
    }
    
    func adjustOrder() {
        alertMessage = "Adjusted order"
    }
    
    func cancelOrder() {
        alertMessage = "Cancelled order"
    }
    
    func viewCart() {
        alertMessage = "Showing cart"
    }
}

struct Menus_Previews: PreviewProvider {
    static var previews: some View {
        Menus()
    }
}
