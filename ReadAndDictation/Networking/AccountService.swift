//
//  AccountService.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/6/9.
//

import Foundation
import Moya
import AppTrackingTransparency
import AdSupport

enum AccountService {
    case visitorLogin
}

extension AccountService: TargetType {
    // 服务器地址
    var baseURL: URL {
        return URL(string: "http://139.224.67.67:8866/")!
    }
    
    // 请求路径
    var path: String {
        switch self {
        case .visitorLogin:
            return "dictation/visitor_login"
        }
        
    }
    
    // 请求方法
    var method: Moya.Method {
        switch self {
        case .visitorLogin:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .visitorLogin:
            return .requestParameters(parameters: ["uuid": ASIdentifierManager.shared().advertisingIdentifier.uuidString], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
