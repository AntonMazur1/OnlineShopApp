//
//  DataStorage.swift
//  onlineShop
//
//  Created by Клоун on 04.08.2022.
//

import Foundation

class DataStorage {
    static let shared = DataStorage()
    
    let names = ["Чайник", "Микроволновка", "Духовой шкаф", "Плита"]
    let prices = [1000, 2000, 3000, 5000]
    
    private init() {}
}
