//
//  Game.swift
//  MyGameCatalogue
//
//  Created by Joe G on 12/07/20.
//  Copyright © 2020 Nusantarian. All rights reserved.
//

import Foundation

struct Game: Decodable, Identifiable {
    var id: Int
    var title: String
    var date: String
    var imagePath: String
    var rating: Float
    var rating_count: Int
}
