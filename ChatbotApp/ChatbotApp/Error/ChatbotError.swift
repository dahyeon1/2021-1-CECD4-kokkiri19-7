//
//  ChatbotError.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/09/20.
//
import Foundation

enum ChatbotError: Error {
    case failToNetworkCommunication
    case failToMakeURLRequest
    case failToMakeURL
    case failDecodeData
    case failUnwrappingData
    case unknown
}

extension ChatbotError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .failToNetworkCommunication:
            return "네트워크 통신을 실패하였습니다."
        case .failToMakeURLRequest:
            return "옳바른 URLRequest를 생성하는데 실패하였습니다."
        case .failToMakeURL:
            return "옳바른 URL을 생성하는데 실패하였습니다."
        case .failDecodeData:
            return "데이터 디코딩에 실패하였습니다."
        case .failUnwrappingData:
            return "데이터를 추출하는데 실패하였습니다."
        case .unknown:
            return "알 수 없는 에러가 발생하였습니다."
        }
    }
}
