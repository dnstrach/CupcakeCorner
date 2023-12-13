//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Dominique Strachan on 12/11/23.
//

import SwiftUI

struct AddressView: View {
    // @Bindable creates missing bindings with @Observable class
    // adding data in view and then pressing back...data will be stay there rather than being discarded because order is binded as same data in each view 
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zipcode", text: $order.zipcode)
            }
            
            Section {
                NavigationLink("Check Out") {
                    CheckOutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}
