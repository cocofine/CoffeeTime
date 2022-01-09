//
//  CoffeeRequest.swift
//  CoffeeTime
//
//  Created by ouyangqi on 2022/1/9.
//

import Foundation
import Moya

//请求时长
private var requestTimeOut: Double = 30
//成功回调
typealias SuccessBlock = ((NSData) -> Void )
//失败回调
typealias FailedBlock = ((String) -> Void )
//错误回调
typealias ErrorBlock = (() -> Void )


//外部使用请求
func CoffeeRequest(_ target: APIProvider, completion: @escaping SuccessBlock) {
    CoffeeRequest(target, completion: completion, failed: nil, errorResult: nil)
}
//去警告
@discardableResult
//核心请求
func CoffeeRequest(_ target: APIProvider, isCache: Bool = false, cacheID: String = "", completion: @escaping SuccessBlock, failed: FailedBlock?, errorResult: ErrorBlock?) -> Cancellable? {
    
    let cacheDir = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first ?? ""
    let path = target.baseURL.absoluteString + target.path + cacheID
    let lastStr = path.replacingOccurrences(of: "/", with: "-")
    let disPath = cacheDir + "/" + lastStr + "-.text"
    
    //设置缓存路径
    if isCache {
        DispatchQueue.global().async {
            do {
//                    let dic = try? JSONSerialization.jsonObject(with: response.data, options: .mutableContainers)
                let str = try String .init(contentsOfFile: disPath, encoding: String.Encoding.utf8)
                DispatchQueue.main.async {
                    /// 字符串转化为data
                    let data = str .data(using: String.Encoding.utf8, allowLossyConversion: true)
                    completion(data! as NSData)
                }
            } catch {
                print(error)
            }
        }
    }
    
    return provider.request(target) { result in
        //隐藏hud
        switch result {
        case let .success(response):
            if isCache {
                // 缓存
                let jsonStr = String(data: response.data, encoding: String.Encoding.utf8) ?? ""
                DispatchQueue.global().async {
                    do {
                        try jsonStr .write(toFile: disPath, atomically: true, encoding: String.Encoding.utf8)
                    } catch {
                        print(error)
                    }
                }
            }
            //成功回调
//            if code == 1 {
//                completion(response.data as NSData)
//            } else {
//                failed(String(data: try! response.mapJSON() as! Data, encoding: String.Encoding.utf8)!)
//            }
            completion(response.data as NSData)

        case let .failure(error):
            print(error)
            errorResult?()
        }
    }
}






//初始化
let provider = MoyaProvider<APIProvider>(endpointClosure: coffeeEndpointClosure, requestClosure: coffeeRequestClosure)


//负责将' TargetType '映射到' EndPoint '的闭包。
//端点闭合。  （相对于hock网络请求，在闭合前，完成一些操作）
let coffeeEndpointClosure = { (target: APIProvider) -> Endpoint in
    
    let url = target.baseURL.absoluteString + target.path

    //加共有接口参数
    
    //默认30s, 部分接口需要额外的时间，在此设置
    switch target {
    case .dog:
        requestTimeOut = 10
    }
    
    
    let endPoint = Endpoint.init(url: url, sampleResponseClosure: { .networkResponse(200, target.sampleData) }, method: target.method, task: target.task, httpHeaderFields: target.headers)
    return endPoint
}


//一个决定是否以及应该执行什么请求的闭包。
//拿到请求request设置一些东西
private let coffeeRequestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
    do {
        var request = try endpoint.urlRequest()
        //设置请求时长
        request.timeoutInterval = requestTimeOut
        //打印请求参数
        print("\(request.url!)")
        print("\(request.httpMethod!)")
        if let reqData = request.httpBody {
            print("\(String(data: reqData, encoding: String.Encoding.utf8) ?? "")")
        }
        done(.success(request))
    } catch {
        done(.failure(MoyaError.underlying(error, nil)))
    }
}


//用于日志记录，网络活动指示器或凭证。
//可以将loading, 埋点写在这
//private let loadingPlugin
//private let logPlugin

