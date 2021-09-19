//
//  APIRequestLoader.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/09/20.
//

import Foundation

protocol APIRequest {
    associatedtype RequestDataType
    associatedtype ResponseDataType
    
    func makeRequest(from data: RequestDataType) throws -> URLRequest
    func parseResponse(data: Data) throws -> ResponseDataType
}
