//
//  Order.swift
//  CupcakeCorner
//
//  Created by Dominique Strachan on 12/11/23.
//

import Foundation

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestsEnabled = "specialRequestsEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zipcode = "zipcode"
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    // type is referencing index
    var type = 0
    var quantity = 3
    
    var specialRequestsEnabled = false {
        didSet {
            if specialRequestsEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles =  false
    
    var name: String {
        didSet {
            UserDefaults.standard.set(newValue, forKey: "name")
        }
    }
    
    var streetAddress: String {
        didSet {
            UserDefaults.standard.set(newValue, forKey: "streetAddress")
        }
    }
    
    var city: String {
        didSet {
            UserDefaults.standard.set(newValue, forKey: "city")
        }
    }
    
    var zipcode: String {
        didSet {
            UserDefaults.standard.set(newValue, forKey: "zipcode")
        }
    }
    
    var hasValidAddress: Bool {
        if name.isReallyEmpty || streetAddress.isReallyEmpty || city.isReallyEmpty || zipcode.isReallyEmpty {
            return false
        }
        
        return true 
    }
    
    // Decimal instead of Double because decimal uses integer mathematics
        // example - no rounding 
    var cost: Decimal {
        var cost = Decimal(quantity) * 2
        
        cost += Decimal(type) / 2
        
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
    
    init() {
        name = UserDefaults.standard.string(forKey: "name") ?? ""
        streetAddress = UserDefaults.standard.string(forKey: "streetAddress") ?? ""
        city = UserDefaults.standard.string(forKey: "city") ?? ""
        zipcode = UserDefaults.standard.string(forKey: "zipcode") ?? ""
    }
}
