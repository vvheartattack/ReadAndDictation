//
//  AccountService.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/6/9.
//

import Foundation
import Moya

enum AccountService {
    case visitorLogin(uuid: String, user_type: String)
}

extension AccountService: TargetType {
    // 服务器地址
    var baseURL: URL {
        return URL(string: "http://139.224.67.67:8866/")!
    }
    
    // 请求路径
    var path: String {
        switch self {
        case .visitorLogin(uuid: _, user_type: _):
            return "dictation/visitor_login"
        }
        
    }
    
    // 请求方法
    var method: Moya.Method {
        switch self {
        case .visitorLogin(uuid: _, user_type: _):
            return .post
        }
    }
    
    var sampleData: Data {
        switch self {
        case let .visitorLogin(uuid, user_type):
            return "{\"uuid\": \(uuid), \"user_type\": \(user_type)}".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case let .visitorLogin(uuid, user_type):
            return .requestParameters(parameters: ["uuid": uuid, "user_type": user_type], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
