//
//  StringExtension.swift
//  CoffeeTime
//
//  Created by ouyangqi on 2022/1/15.
//

import Foundation

extension String {
    
    /// 判断字符串是否有效，空，空格，换行都属于无效字符串
    func isValidString() -> Bool {
        if self.isEmpty {
            return false
        }
        if self.count == 0 {
            return false
        }
        if self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }
        return true
    }
    
    ///计算字符串宽高
    func boundingRect(size: CGSize, attributes: [NSAttributedString.Key: Any]?) -> CGSize {
        if self.isValidString() {
            let str = NSString(string: self)
            let s = str.boundingRect(with: size, options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.usesFontLeading.rawValue | NSStringDrawingOptions.usesLineFragmentOrigin.rawValue), attributes: attributes, context: nil).size
            return s
        } else {
            return CGSize.zero
        }
    }
    
}
