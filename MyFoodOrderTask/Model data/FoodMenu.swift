//
//  FoodMeny.swift
//  MyFoodOrderTask
//
//  Created by Nazrin Sultanlı on 07.10.23.
//

import Foundation

struct FoodCategory: Codable {
    let category: String?
    let categoryImage: String?
    let categoryType: [FoodItem]?
}

struct FoodItem: Codable {
    let foodName: String?
    let foodDescription: String?
    let foodImage: String?
    let foodPrice: Double?
}
