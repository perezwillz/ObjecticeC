//
//  ItemController.swift
//  Collect
//
//  Created by Andrew R Madsen on 7/21/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import Foundation

class ItemController {
    
    func createNewItem(withName name: String, value: Int? = nil, location: String? = nil) -> Item {
        let item = Item(name: name, value: value, location: location)
        items.append(item)
        return item
    }
    
    func update(item: Item, withName name: String, value: Int? = nil, location: String? = nil) {
        
        item.name = name
        item.value = value
        item.location = location
    }
    
    // MARK: Properties
    
    private (set) var items = [Item]()
}
