//
//  NodesResponseModel.swift
//  BIPACC
//
//  Created by Fabio Yudi Takahara on 21/02/25.
//

import SwiftUI

struct NodesResponseModel: Decodable {
    let publicKey: String?
    let alias: String?
    let channels: Int?
    let capacity: Int?
    let firstSeen: Int?
    let updatedAt: Int?
    let city: CityResponseModel?
    let country: CountryResponseModel?
}

struct CityResponseModel: Decodable {
    let de: String?
    let en: String?
    let es: String?
    let fr: String?
    let ja: String?
    let ptBR: String?
    let ru: String?
    let zhCN: String?
    
    enum codingKeys: String, CodingKey {
        case ptBR = "pt-BR"
        case zhCN = "zh-CN"
    }
}

struct CountryResponseModel: Decodable {
    let de: String?
    let en: String?
    let es: String?
    let fr: String?
    let ja: String?
    let ptBR: String?
    let ru: String?
    let zhCN: String?
    
    enum codingKeys: String, CodingKey {
        case ptBR = "pt-BR"
        case zhCN = "zh-CN"
    }
}
