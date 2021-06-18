//
//  VisitorLoginModel.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/6/11.
//

import Foundation

struct VisitorLoginModel: Codable {
    var code: Int
    var data: VisitorModel
    var message: String?
    var state: Int?
}

struct VisitorModel: Codable {
    var studentID: String
    var name: String?
    var expirationTime: String?
    var isBuy: Bool
    var isExperience: Bool
    var isSignUp: Bool
    var isVip: Bool
    var leftDays: Int
    var token: String?
    
    // 自定义键值名
    private enum CodingKeys: String, CodingKey {
        case studentID = "student_id"
        case name
        case expirationTime = "expiration_time"
        case isBuy = "is_buy"
        case isExperience = "is_experience"
        case isSignUp = "is_sign_up"
        case isVip = "is_vip"
        case leftDays = "left_days"
        case token
        
    }
}

