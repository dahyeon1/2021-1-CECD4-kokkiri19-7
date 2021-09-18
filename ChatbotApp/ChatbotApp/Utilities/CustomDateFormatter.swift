//
//  CustomDateFormatter.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/09/18.
//

import Foundation

struct CustomDateFormatter {
    static let birthdayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter
    }()
}
