//
//  RandomMemeEntity.swift
//  InstantMemeMaker
//
//  Created by Fulden Onan on 16.12.2022.
//

import Foundation

// MARK: - Response
struct Response: Codable {
    let success: Bool?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let memes: [Meme]?
}

// MARK: - Meme
struct Meme: Codable {
    let id, name: String?
    let url: String?
    let width, height, boxCount, captions: Int?
}
