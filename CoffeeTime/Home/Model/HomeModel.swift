//
//  HomeModel.swift
//  CoffeeTime
//
//  Created by ouyangqi on 2022/12/20.
//

import UIKit

class HomeModel: NSObject {
    
    var name: String?
    var age: Int = 0
    var error: NSError?
    
//setValue:forUndefinedKey:]
    
    override func setValue(_ value: Any?, forUndefinedKey: String) {
        print(value, forUndefinedKey)
    }

}
