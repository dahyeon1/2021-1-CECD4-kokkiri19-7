//
//  User.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/09/14.
//

import Foundation

final class User {
    static let shared = User()
    private init() {}
    
    var email: String?
    var nickname: String?
    var gender: Gender?
    var birthday: Date?
    var age: Int?
    var city: String?
    var province: String?
    
    func reset() {
        email = nil
        nickname = nil
        gender = nil
        birthday = nil
        age = nil
        city = nil
        province = nil
    }
}

enum Gender: String {
    case male = "남성"
    case female = "여성"
}
