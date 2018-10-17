//
//  Item.swift
//  Collect
//
//  Created by Andrew R Madsen on 7/21/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import Foundation

class Item {
    
    init(name: String, value: Int?, location: String?) {
        self.name = name
        self.value = value
        self.location = location
    }
    
    var name: String
    var value: Int?
    var location: String?
}
