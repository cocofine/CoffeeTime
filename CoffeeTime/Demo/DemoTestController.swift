//
//  DemoTestController.swift
//  CoffeeTime
//
//  Created by ouyangqi on 2023/2/14.
//

import UIKit




class DemoTestController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let type: TypePrinter<String> = TypePrinter()
//        type.test("")
        let type: AnyPrinter<Int> = AnyPrinter(TypePrinter())
        type.test(2)

    }
    


    
    
    
}


//===============类型擦除===================
protocol Printer {
    associatedtype AbstackType
    func test(_ param: AbstackType)
}

struct AnyPrinter<T>: Printer {
    private let _test: (T) -> ()
    init<Base: Printer>(_ base: Base) where Base.AbstackType == T {
        _test = base.test
    }
    
    func test(_ param: T) {
        _test(param)
    }
}

struct TypePrinter<T>: Printer {
    typealias AbstackType = T
    func test(_ param: T) {
        print(param)
    }
}
