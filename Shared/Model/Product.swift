//
//  Product.swift
//  EcommerceAppKit (iOS)
//
//  Created by Ersultan on 27/11/21.
//

import SwiftUI

// Product Model....
struct Product: Identifiable,Hashable {
    var id = UUID().uuidString
    var type: ProductType
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String
    var productImage: String = ""
    var quantity: Int = 1
}

// Product Types...
enum ProductType: String,CaseIterable{
    case Wearable = "Девочки"
    case Laptops = "Мальчики"
    case Phones = "Женское"
    case Tablets = "Мужское"
}

