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
//        CoffeeRequest(APIProvider.dog) { data in
//            let dic = try? JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers)
//            print(dic ?? "")
//        }
        
        
        
//        if (@available(iOS 12.0,*)) {
//            NSError *error;
//            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:token requiringSecureCoding:YES error:&error];
//            if (error) {
//                NSLog(@"token保存失败%@",error);
//            } else {
//                [data writeToFile:[self tokenFilePath] atomically:YES];
//            }
//        } else {
//            [NSKeyedArchiver archiveRootObject:token toFile:[self tokenFilePath]];
//        }
        
//        let error = NSError.init(domain: "123", code: 3, userInfo: nil)
//
//        if let data = try? NSKeyedArchiver.archivedData(withRootObject: error, requiringSecureCoding: true) {
//
//            var accountPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//            accountPath = (accountPath as NSString).appendingPathComponent("userInfo.plist")
//
//            if let result = try? data.write(to: URL.init(fileURLWithPath: accountPath)) {
//                print("11")
//            }
//
//        }
//        let a = 5
//        let s = MemoryLayout<Int32>.size
        
        
//        let btn = UIButton()
//        self.view.addSubview(btn)
//        btn.backgroundColor = .red
//        btn.snp.makeConstraints { make in
//            make.left.top.equalTo(100)
//            make.height.width.equalTo(100)
//        }
//        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        
        
        let btn = UIButton();
        btn.setTitle("异常", for: .normal)
        btn.setImage(UIImage.init(named: "bqr_watching_hint"), for: .normal)
        btn.backgroundColor = .yellow
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        
        
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
//        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 4)
        
        
        self.view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.left.top.equalTo(300);
            make.height.equalTo(18);
        }
        
        
    }
    
    @objc func btnAction() {
        let vc = DemoTestController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    


    
}
