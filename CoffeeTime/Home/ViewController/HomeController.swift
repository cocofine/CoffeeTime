//
//  HomeController.swift
//  CoffeeTime
//
//  Created by ouyangqi on 2022/1/8.
//

import UIKit

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange
        
        //Moya适用
//        MoyaProvider<APIProvider>().request(.dog) { result in
//            switch result {
//            case let .success(response):
//                let dic = try? JSONSerialization.jsonObject(with: response.data, options: .mutableContainers)
//                print(dic ?? "")
//            case let .failure(error):
//                print(error)
//            }
//        }
        
        //二次封装使用
        CoffeeRequest(APIProvider.dog) { data in
            let dic = try? JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers)
            print(dic ?? "")
        }
        
        
    }
    


    
}
