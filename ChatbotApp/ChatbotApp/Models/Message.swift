//
//  Message.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/05/31.
//

import UIKit

enum MessageType {
    case user
    case botText
}

final class Message {
    var text: String = ""
    var date: Date
    var type: MessageType
    
    init(date: Date, type: MessageType) {
        self.date = date
        self.type = type
    }
    
    convenience init(text: String, date: Date, type: MessageType) {
        self.init(date: date, type: type)
        self.text = text
    }
    
    //MARK : return user or bot image
    func getImage() -> String {
        switch self.type {
        case .user:
            return "user.png"
        default:
            return "bot.pdf"
        }
    }
}
