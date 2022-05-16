//
//  HomeViewModel.swift
//  EcommerceAppKit (iOS)
//
//  Created by Ersultan on 27/11/21.
//

import SwiftUI

// Using Combine to monitor search field and if user leaves for .5 secs then starts searching...
// to avoid memory issue...
import Combine

class HomeViewModel: ObservableObject {

    @Published var productType: ProductType = .Wearable
    
    // Sample Products...
    @Published var products: [Product] = [
    
        Product(type: .Laptops, title: "Cвитшот", subtitle: "Цвет - Разноцветный", price: "3990тг",productImage: "boys-1"),
        Product(type: .Laptops, title: "Свитшот", subtitle: "Цвет - Серый", price: "1990тг", productImage: "boys-2"),
        Product(type: .Laptops, title: "Худи", subtitle: "Цвет - Черный", price: "3990тг", productImage: "boys-3"),
        Product(type: .Laptops, title: "Свитшот", subtitle: "Цвет - Зеленый", price: "2990тг", productImage: "boys-4"),
        Product(type: .Wearable, title: "Свитшот", subtitle: "Цвет - Черный", price: "2990тг", productImage: "girls-1"),
        Product(type: .Wearable, title: "Свитшот", subtitle: "Цвет - Серый", price: "3990тг", productImage: "girls-2"),
        Product(type: .Wearable, title: "Свитшот", subtitle: "Цвет - Сиреневый", price: "2780тг", productImage: "girls-3"),
        Product(type: .Wearable, title: "Свитшот", subtitle: "Цвет - Серый", price: "$3390тг", productImage: "girls-4"),
        Product(type: .Phones, title: "Бюстгалтер", subtitle: "Цвет - Сиреневый", price: "1990тг", productImage: "women-1"),
        Product(type: .Phones, title: "Блейзер", subtitle: "Цвет - Черный", price: "5790тг", productImage: "women-2"),
        Product(type: .Phones, title: "Блейзер", subtitle: "Цвет - Бежевый", price: "$8990тг", productImage: "women-3"),
        Product(type: .Phones, title: "Бюстгалтер", subtitle: "Цвет - Черный", price: "2550тг", productImage: "women-4"),
        Product(type: .Tablets, title: "Шорты", subtitle: "Цвет - Белый", price: "2870тг", productImage: "men-1"),
        Product(type: .Tablets, title: "Футболка", subtitle: "Цвет - Белый", price: "4990тг", productImage: "men-2"),
        Product(type: .Tablets, title: "Боксерки", subtitle: "Цвет - Серый", price: "3880тг", productImage: "men-3"),
        Product(type: .Tablets, title: "Шорты", subtitle: "Цвет - Черный", price: "5690тг", productImage: "men-4"),
    ]
    
    // Filtered Products...
    @Published var filteredProducts: [Product] = []
    
    // More products on the type..
    @Published var showMoreProductsOnType: Bool = false
    
    // Search Data...
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    @Published var searchedProducts: [Product]?
    
    var searchCancellable: AnyCancellable?
    
    init(){
        filterProductByType()
        
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str != ""{
                    self.filterProductBySearch()
                }
                else{
                    self.searchedProducts = nil
                }
            })
    }
    
    func filterProductByType(){
        
        // Filtering Product By Product Type...
        DispatchQueue.global(qos: .userInteractive).async {
            
            let results = self.products
            // Since it will require more memory so were using lazy to perform more...
                .lazy
                .filter { product in
                    
                    return product.type == self.productType
                }
            // Limiting result...
                .prefix(4)
            
            DispatchQueue.main.async {
                
                self.filteredProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
    
    func filterProductBySearch(){
        
        // Filtering Product By Product Type...
        DispatchQueue.global(qos: .userInteractive).async {
            
            let results = self.products
            // Since it will require more memory so were using lazy to perform more...
                .lazy
                .filter { product in
                    
                    return product.title.lowercased().contains(self.searchText.lowercased())
                }
            
            DispatchQueue.main.async {
                
                self.searchedProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
}
