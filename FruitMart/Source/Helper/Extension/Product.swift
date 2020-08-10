//
//  Product.swift
//  FruitMart
//
//  Created by 배송비 on 2020/08/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

struct Product {
    let id: UUID = UUID()
    
    let name: String
    let imageName: String
    let price: Int
    let description: String
    var isFavorite: Bool = false
}

extension Product: Decodable { }
extension Product: Identifiable { }

let productSamples = [
    Product(name: "나는야 무화과", imageName: "fig", price: 3100, description: "소화가 잘 되고 변ㅂ에 좋은 달달한 국내산 무화과예요. 고기와 찰떡궁합!"),
    Product(name: "유기농 아모카도", imageName: "avocado", price: 2900, description: "미네랄도 풍부하고, 요리와 장식과 소스로도 좋은 아보카도입니다."),
    Product(name: "바나나 안 바나나", imageName: "banana", price: 2400, description: "달콤한 맛의 바나나. 이렇게 맛있으니 내가 바나나 안 바나ㅏㄴ나?", isFavorite: true),
    Product(name: "아임 파인애플", imageName: "pineapple", price: 3000, description: "소화와 피로회복, 비타민까지! 한번에"),
    Product(name: "시원한 수박", imageName: "watermelon", price: 3500, description: "아이들이 너무나 좋아하는 시원하고 달콤한 수박이에요.", isFavorite: true),
    Product(name: "베리베이 블루베리", imageName: "blueberry", price: 2300, description: "타임스지 선정 10대파워 푸드, 신이 내린 선물이라 불리우는 블루베리예요.")
]
