//
//  ShopController.swift
//  CoffeeTime
//
//  Created by ouyangqi on 2022/1/8.
//

import UIKit

class ShopController: UIViewController {
    
    lazy var imgView: UIImageView = {
        let imgView = UIImageView.init()
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.purple
        
//        imgView.kf.setImage(with: <#T##Source?#>, placeholder: <#T##Placeholder?#>, options: <#T##KingfisherOptionsInfo?#>, completionHandler: <#T##((Result<RetrieveImageResult, KingfisherError>) -> Void)?##((Result<RetrieveImageResult, KingfisherError>) -> Void)?##(Result<RetrieveImageResult, KingfisherError>) -> Void#>)
//        
//        imgView.kf.setImage(with: <#T##Resource?#>, placeholder: <#T##Placeholder?#>, options: <#T##KingfisherOptionsInfo?#>, completionHandler: <#T##((Result<RetrieveImageResult, KingfisherError>) -> Void)?##((Result<RetrieveImageResult, KingfisherError>) -> Void)?##(Result<RetrieveImageResult, KingfisherError>) -> Void#>)
//        
//        imgView.kf.setImage(with: <#T##ImageDataProvider?#>, placeholder: <#T##Placeholder?#>, options: <#T##KingfisherOptionsInfo?#>, completionHandler: <#T##((Result<RetrieveImageResult, KingfisherError>) -> Void)?##((Result<RetrieveImageResult, KingfisherError>) -> Void)?##(Result<RetrieveImageResult, KingfisherError>) -> Void#>)
//        
//        imgView.kf.setImage(with: <#T##ImageDataProvider?#>, placeholder: <#T##Placeholder?#>, options: <#T##KingfisherOptionsInfo?#>, progressBlock: <#T##DownloadProgressBlock?##DownloadProgressBlock?##(_ receivedSize: Int64, _ totalSize: Int64) -> Void#>, completionHandler: <#T##((Result<RetrieveImageResult, KingfisherError>) -> Void)?##((Result<RetrieveImageResult, KingfisherError>) -> Void)?##(Result<RetrieveImageResult, KingfisherError>) -> Void#>)
//        
//        imgView.kf.setImage(with: <#T##Source?#>, placeholder: <#T##Placeholder?#>, options: <#T##KingfisherOptionsInfo?#>, progressBlock: <#T##DownloadProgressBlock?##DownloadProgressBlock?##(_ receivedSize: Int64, _ totalSize: Int64) -> Void#>, completionHandler: <#T##((Result<RetrieveImageResult, KingfisherError>) -> Void)?##((Result<RetrieveImageResult, KingfisherError>) -> Void)?##(Result<RetrieveImageResult, KingfisherError>) -> Void#>)
//        
//        imgView.kf.setImage(with: <#T##Resource?#>, placeholder: <#T##Placeholder?#>, options: <#T##KingfisherOptionsInfo?#>, progressBlock: <#T##DownloadProgressBlock?##DownloadProgressBlock?##(_ receivedSize: Int64, _ totalSize: Int64) -> Void#>, completionHandler: <#T##((Result<RetrieveImageResult, KingfisherError>) -> Void)?##((Result<RetrieveImageResult, KingfisherError>) -> Void)?##(Result<RetrieveImageResult, KingfisherError>) -> Void#>)
    }
    


    
}
