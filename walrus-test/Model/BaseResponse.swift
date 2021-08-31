//
//  BaseResponse.swift
//  walrus-test
//
//  Created by Chaitanya Deshpande on 31/08/21.
//

import Foundation
struct BaseResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
