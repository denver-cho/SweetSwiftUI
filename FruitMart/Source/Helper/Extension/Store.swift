//
//  Store.swift
//  FruitMart
//
//  Created by 배송비 on 2020/08/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

final class Store {
    var products: [Product]
    
    init(filename: String = "ProductData.json") {
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
}
