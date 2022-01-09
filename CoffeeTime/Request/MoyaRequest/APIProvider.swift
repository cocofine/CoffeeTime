//
//  APIProvider.swift
//  CoffeeTime
//
//  Created by ouyangqi on 2022/1/9.
//

import Foundation



enum APIProvider {
    case dog
}

extension APIProvider: TargetType {

    var baseURL: URL {
        return URL(string: "https://fapi.haohaozhu.cn/")!
    }
    
    var path: String {
        switch self {
        case .dog:
            return "dog"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .dog:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .dog:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .dog:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
    
    
}
