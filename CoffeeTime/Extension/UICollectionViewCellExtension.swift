//
//  UICollectionViewExtension.swift
//  CoffeeTime
//
//  Created by ouyangqi on 2022/1/15.
//

import Foundation

extension UICollectionViewCell {
    
    class func cellWithCollectionView(collectionView: UICollectionView, indexPath: IndexPath) -> Self {
        
        let className = String(describing: self)
        let path = Bundle.main.path(forResource: className, ofType: "nib")
        
        if path != nil {
            collectionView.register(UINib.init(nibName: className, bundle: nil), forCellWithReuseIdentifier: className)
        } else {
            collectionView.register(self.classForCoder(), forCellWithReuseIdentifier: className)
        }
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as! Self
    }
    
    
}
