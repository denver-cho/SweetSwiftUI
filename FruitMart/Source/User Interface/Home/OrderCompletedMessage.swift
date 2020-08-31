//
//  OrderCompletedMessage.swift
//  FruitMart
//
//  Created by 배송비 on 2020/08/31.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct OrderCompletedMessage: View {
    var body: some View {
        Text("주문 완료!")
            .font(.system(size: 24))
            .bold()
            .kerning(2)
    }
}

struct OrderCompletedMessage_Previews: PreviewProvider {
    static var previews: some View {
        OrderCompletedMessage()
    }
}
