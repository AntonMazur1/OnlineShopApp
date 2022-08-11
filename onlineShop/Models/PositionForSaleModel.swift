//
//  PositionForSaleModel.swift
//  onlineShop
//
//  Created by Клоун on 04.08.2022.
//

import Foundation

struct PositionForSaleModel: Hashable {
    let image: String
    let name: String
    let price: String
    
    static func getPositions() -> [PositionForSaleModel] {
        let positions = [
            PositionForSaleModel(image: "Духовой шкаф", name: "Духовой шкаф", price: "1000"),
            PositionForSaleModel(image: "Плита", name: "Плита", price: "2000"),
            PositionForSaleModel(image: "Микроволновка", name: "Микроволновка", price: "3000"),
            PositionForSaleModel(image: "Чайник", name: "Чайник", price: "5000")
        ]
        
        return positions
    }
}


