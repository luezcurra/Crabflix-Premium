//
//  Trailer.swift
//  CrabflixPremium
//
//  Created by Luciana Ines Ezcurra on 26/09/2019.
//  Copyright © 2019 Luciana Ines Ezcurra. All rights reserved.
//

import Foundation

class Trailer {
    
    var name: String
    var key: String
    var id: String
    
    init(dictionary: [String: AnyObject]) {
        self.name = dictionary["name"] as? String ?? "no name"
        self.key = dictionary["key"] as? String ?? "no video"
        self.id = dictionary["id"] as? String ?? "no id"
    }
}
