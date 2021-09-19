//
//  Locations.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/09/18.
//

enum City: String, CaseIterable {
    case 서울 = "서울"
    case 경기도 = "경기도"
    static let list: [City] = {
        var citys = [City]()
        for city in City.allCases {
            citys.append(city)
        }
        return citys
    }()
}

enum 서울: String, CaseIterable {
    case 강남구 = "강남구"
    case 중구 = "중구"
    case 영등포구 = "영등포구"
    
    static let list: [서울] = {
        var provinces = [서울]()
        for province in 서울.allCases {
            provinces.append(province)
        }
        return provinces
    }()
}

enum 경기도: String, CaseIterable {
    case 분당구 = "분당구"
    case 수정구 = "수정구"
    case 수지구 = "수지구"
    
    static let list: [경기도] = {
        var provinces = [경기도]()
        for province in 경기도.allCases {
            provinces.append(province)
        }
        return provinces
    }()
}
