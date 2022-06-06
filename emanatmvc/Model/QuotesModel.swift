//
//  QuotesModel.swift
//  emanatmvc
//
//  Created by Ayxan Seferli on 06.06.22.
//

import Foundation

struct Quote: Codable {
    let quotes: [Quotes]
    let total: Int
    let skip: Int
    let limit: Int
    
}

struct Quotes: Codable {
    let id: Int
    let quote: String
    let author: String
}
