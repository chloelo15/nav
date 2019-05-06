//
//  BlogPost.swift
//  CH-final
//
//  Created by Chloe Lo on 4/17/19.
//  Copyright © 2019 Chloe Lo. All rights reserved.
//

import Foundation
import UIKit

class BlogPost {
    let user: String!
    var country: String!
    var city: String!
    var identifier: String!
    var description: String!
    var fav1: String!
    var fav2: String!
    var fav3: String!
    var more: String!
    var date: String!
    var tripTitle: String!
    
    init(name: String, country: String, city: String, fav1: String, fav2: String, fav3: String, more: String, date: String, tripTitle: String) {
        self.user = name
        self.country = country
        self.city = city
        self.fav1 = fav1
        self.fav2 = fav2
        self.fav3 = fav3
        self.more = more
        self.date = date
        self.tripTitle = tripTitle
    }
}
