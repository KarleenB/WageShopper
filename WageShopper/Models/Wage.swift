//
//  Wage.swift
//  WageShopper
//
//  Created by Branden Karleen on 9/21/21.
//

import Foundation

class Wage {
    
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}

