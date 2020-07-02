//
//  Order.swift
//  CupcakeCorner
//
//  Created by Garima Bothra on 02/07/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import Foundation

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
