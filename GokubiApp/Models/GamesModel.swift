//
//  GamesModel.swift
//  gokubi.app
//
//  Created by Alzea Arafat on 03/11/24.
//

import Foundation
import SwiftData

enum Platforms: String, Codable, CaseIterable {
    case ps4
    case ps5
    case xboxSeries
    case pc
    case nintendoSwitch
    case mobile
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
    var playtime: Int
    var rating: Int?
    var notes: String?
    var completed: Bool
    var dateAdded: Date
    var genre: Genres
    var platforms: Platforms
    
    init(title: String, developer: String, playtime: Int, rating: Int? = nil, notes: String? = nil, completed: Bool, dateAdded: Date, genre: Genres, platforms: Platforms) {
        self.title = title
        self.developer = developer
        self.playtime = playtime
        self.rating = rating
        self.notes = notes
        self.completed = completed
        self.dateAdded = dateAdded
        self.genre = genre
        self.platforms = platforms
    }
}
