//
//  Order.swift
//  CupcakeCorner
//
//  Created by Garima Bothra on 02/07/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import Foundation

struct OrderStruct: Codable {
    // MARK: Product Details
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
     var type = 0
     var quantity = 3

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
        }
    var extraFrosting = false
    var addSprinkles = false

    var cost: Double {
        // ₹25 per cake
        var cost = Double(quantity) * 25

        // complicated cakes cost more
        //cost += (Double(type) / 2)

        // ₹10/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity) * 10
        }

        // ₹5/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) * 5
        }

        return cost
    }

    // MARK: Address Details
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""

    var hasValidAddress: Bool {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }

        return true
    }

}

class Order: ObservableObject, Codable {
    @Published var order = OrderStruct()

    enum CodingKeys: CodingKey {
        case orderStruct
    }

    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)

            try container.encode(order, forKey: .orderStruct)
    }

    init() { }

    required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            order = try container.decode(OrderStruct.self, forKey: .orderStruct)
    }
}
