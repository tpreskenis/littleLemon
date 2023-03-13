//
//  MenuItem.swift
//  LittleLemonResturant
//
//  Created by Tim Preskenis on 3/10/23.
//

import Foundation

struct MenuItem: Decodable {
    let title: String
    let price: String
    let image: String
    let category: String
    let description: String
}
