//
//  ProductDetailView.swift
//  FruitMart
//
//  Created by 배송비 on 2020/08/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct ProductDetailView: View {
    @State private var quantity: Int = 1
    @State private var showingAlert: Bool = false
    @EnvironmentObject private var store: Store
    
    let product: Product
    
    var body: some View {
        VStack(spacing: 0) {
            productImage
            orderView
        }
        .edgesIgnoringSafeArea(.top)
        .alert(isPresented: $showingAlert) {
            confirmAlert
        }
    }
}

extension ProductDetailView {
    var productImage: some View {
        Image(self.product.imageName)
            .resizable()
            .scaledToFill()
    }
    
    var orderView: some View {
        GeometryReader {
            VStack(alignment: .leading) {
                self.productDescription
                Spacer()
                self.priceInfo
                self.placeOrderButton
            }
            .frame(height: $0.size.height + 10)
            .padding(32)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -5)
            
        }
    }
    
    var productDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(product.name)
                    .font(.largeTitle).fontWeight(.medium)
                    .foregroundColor(.black)
                Spacer()
                
                FavoriteButton(product: product)
            }
            
            Text(splitText(product.description))
                .foregroundColor(.secondaryText)
                .fixedSize()
        }
    }
    
    var priceInfo: some View {
        let price = quantity * product.price
        return HStack {
            (Text("₩") + Text("\(price)").font(.title)).fontWeight(.medium)
            Spacer()
            QuantitySelector(quantity: $quantity)
        }
        .foregroundColor(.black)
    }
    
    var placeOrderButton: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Capsule()
                .fill(Color.peach)
                .frame(maxWidth: .infinity, minHeight: 30, maxHeight:  55)
                .overlay(Text("주문하기"))
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(Color.white)
                .padding(.vertical, 8)
        }
    }
    
    func splitText(_ text: String) -> String {
       guard !text.isEmpty else {
           return text
       }
       
       let centerIdx = text.index(text.startIndex, offsetBy: text.count / 2)
       let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ")
           ?? text[centerIdx...].firstIndex(of: " ")
           ?? text.index(before: text.endIndex)
       let afterSpaceIdx = text.index(after: centerSpaceIdx)
       let lhsString = text[..<afterSpaceIdx].trimmingCharacters(in: .whitespaces)
       let rhsString = text[afterSpaceIdx...].trimmingCharacters(in: .whitespaces)
       
       return String(lhsString + "\n" + rhsString)
    }
    
    var confirmAlert: Alert {
        Alert(
            title: Text("주문 확인"),
            message: Text("\(product.name)을(를) \(quantity)개 구매하시겠습니까?"),
            primaryButton: .default(Text("확인"), action: {
                self.placeOrder()
            }),
            secondaryButton: .cancel(Text("취소"))
        )
    }
    
    func placeOrder() {
        store.placeOrder(product: product, quantity: quantity)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: productSamples[0])
    }
}
