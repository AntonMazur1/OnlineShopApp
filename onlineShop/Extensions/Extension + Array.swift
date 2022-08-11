//
//  Extension + Array.swift
//  onlineShop
//
//  Created by Клоун on 09.08.2022.
//

extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()

        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }

        return result
    }
}
