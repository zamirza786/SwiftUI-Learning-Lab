//
//  Appetizer.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 30/03/26.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    let price: Double
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(
        id: 0001,
        name: "Test Appetizer",
        description: "This is the description for my appetizer. It's yummy.",
        imageURL: "",
        price: 9.99,
        calories: 99,
        protein: 99,
        carbs: 99
    )
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItem1 = Appetizer(
        id: 0001,
        name: "Test Appetizer 1",
        description: "This is the description for my appetizer. It's yummy.",
        imageURL: "",
        price: 9.99,
        calories: 99,
        protein: 99,
        carbs: 99
    )
    
    static let orderItem2 = Appetizer(
        id: 0002,
        name: "Test Appetizer 2",
        description: "This is the description for my appetizer. It's yummy.",
        imageURL: "",
        price: 9.99,
        calories: 99,
        protein: 99,
        carbs: 99
    )
    
    static let orderItem3 = Appetizer(
        id: 0003,
        name: "Test Appetizer 3",
        description: "This is the description for my appetizer. It's yummy.",
        imageURL: "",
        price: 9.99,
        calories: 99,
        protein: 99,
        carbs: 99
    )
    
    static let orderItems = [orderItem1, orderItem2, orderItem3]
}
