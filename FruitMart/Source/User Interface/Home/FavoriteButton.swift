//
//  FavoriteButton.swift
//  FruitMart
//
//  Created by denver.c on 2020/08/24.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject private var store: Store
    let product: Product
    
    private var imageName: String {
        product.isFavorite ? "heart.fill": "heart"
    }
    var body: some View {
        Button(action: {
            self.store.toggleFavorite(of: self.product)
        }) {
            Image(systemName: imageName)
                .imageScale(.large)
                .foregroundColor(.peach)
                .frame(width: 32, height: 32)
                .onTapGesture {
                    self.store.toggleFavorite(of: self.product)
            }
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(product: Product(name: "야야야", imageName: "heart.fill", price: 3000, description: "무화가리가리"))
            .previewLayout(.sizeThatFits)
    }
}
