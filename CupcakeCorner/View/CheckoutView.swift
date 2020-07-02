//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Garima Bothra on 02/07/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {

    @ObservedObject var order: Order

    var body: some View {
        Text("Checkout View")
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
