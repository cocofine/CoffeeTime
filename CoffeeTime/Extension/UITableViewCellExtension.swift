//
//  UITableViewCellExtension.swift
//  CoffeeTime
//
//  Created by ouyangqi on 2022/1/15.
//

import Foundation

extension UITableViewCell {
    
    class func cellWithTableView(tableView: UITableView) -> Self {
        
        let className = String(describing: self)
        let path = Bundle.main.path(forResource: className, ofType: "nib")
        
        if path != nil {
            tableView.register(UINib.init(nibName: className, bundle: nil), forCellReuseIdentifier: className)
        } else {
            tableView.register(self.classForCoder(), forCellReuseIdentifier: className)
        }
        
        return tableView.dequeueReusableCell(withIdentifier: className) as! Self
    }
    
    
}
