//
//  JsonDecoder.swift
//  sportsApp
//
//  Created by ahmed rabie on 22/06/2022.
//

import Foundation
func convertFromJson<T: Codable>(data: Data) -> T? {
    let jsonDecoder = JSONDecoder()
    let decodedArray = try? jsonDecoder.decode(T.self, from: data)
    return decodedArray
}
