//
//  DiscoveryController.swift
//  CoffeeTime
//
//  Created by ouyangqi on 2022/1/8.
//

import UIKit

class DiscoveryController: UIViewController {
    
    lazy var btn: UIButton = {
        let btn = UIButton.init()
        btn.setTitle("登录", for: .normal)
        btn.backgroundColor = UIColor.blue
        return btn
    }()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.cyan
        
        self.view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.left.top.equalTo(100)
            make.width.height.equalTo(100)
        }
        
        btn.rx.tap
            .subscribe(onNext: {
                let vc = DataSourcesController.init()
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
        

        
    }
    


    
}
