//
//  DataStorage.swift
//  onlineShop
//
//  Created by Клоун on 07.08.2022.
//

import Foundation

class DataStorage {
    static let shared = DataStorage()
    
    let cities = ["Киев", "Донецк", "Одесса", "Харьков", "Мариуполь", "Волноваха", "Бровары", "Львов", "Черновцы", "Тернополь", "Ужгород", "Житомир", "Ирпень", "Чернигов"]
    
    let waysOfDelivery = ["Новая Почта", "Укр Почта", "Самовывоз", "Justin"]
    
    private init() {}
}
