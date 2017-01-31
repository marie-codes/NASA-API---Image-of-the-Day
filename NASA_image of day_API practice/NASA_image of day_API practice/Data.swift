//
//  Data.swift
//  NASA_image of day_API practice
//
//  Created by Marie Park on 11/16/16.
//  Copyright © 2016 Marie Park. All rights reserved.
//

import Foundation


struct PlanetInfo {
    var title: String
    var explanation: String
    var date: String
    var url: String
    
    init(dictionary: [String: String]){
        self.title = dictionary["title"]!
        self.explanation = dictionary["explanation"]!
        self.date = dictionary["date"]!
        self.url = dictionary["url"]!
    }
}
