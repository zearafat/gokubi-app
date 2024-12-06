//
//  GamesModel.swift
//  GokubiApp.app
//
//  Created by Alzea Arafat on 03/11/24.
//

import Foundation
import SwiftData

enum Platforms: String, Codable, CaseIterable {
    case ps4 = "PlayStation 4"
    case ps5 = "PlayStation 5"
    case xboxSeries = "Xbox Series X|S"
    case pc = "PC"
    case nintendoSwitch = "Nintendo Switch"
    case mobile = "Mobile"
}

enum Genres: String, Codable, CaseIterable {
    case rogueLike
    case metroidvania
    case action
    case adventure
    case puzzle
    case rpg
    case simulation
    case strategy
    case horror
    case platformer
    case visualNovel
    case sports
    case rhythm
    case sandbox
    case shooter
    case other // Catch-all for genres not listed
}

@Model
final class GamesModel {
    var title: String
    var developer: String
    var playtime: Double
    var rating: Int
    var notes: String?
    var completed: Bool
    var dateAdded: Date
    var genre: Genres
    var platforms: Platforms
    var coverImageData: Data?
    var pros: [String?]
    var cons: [String?]
    
    init(
        title: String,
        developer: String,
        playtime: Double,
        rating: Int,
        notes: String? = nil,
        completed: Bool,
        dateAdded: Date,
        genre: Genres,
        platforms: Platforms,
        coverImageData: Data? = nil,
        pros: [String?] = [nil, nil, nil],
        cons: [String?] = [nil, nil, nil]
    ) {
        self.title = title
        self.developer = developer
        self.playtime = playtime
        self.rating = rating
        self.notes = notes
        self.completed = completed
        self.dateAdded = dateAdded
        self.genre = genre
        self.platforms = platforms
        self.coverImageData = coverImageData
        self.pros = pros
        self.cons = cons
    }
}
