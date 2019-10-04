//
//  Film.swift
//  CrabflixPremium
//
//  Created by Luciana Ines Ezcurra on 25/09/2019.
//  Copyright © 2019 Luciana Ines Ezcurra. All rights reserved.
//

import Foundation

class Film {
    
    var title: String
    var description: String
    var popularity: Int
    var poster_path: String
    var date: String
    var backdrop_path: String
    var id: Int
    var average: Double
    var isFavorite = false
    
    init(dictionary: [String: AnyObject]) {
        
        self.title = dictionary["title"] as? String ?? "no name"
        self.description = dictionary["overview"] as? String ?? "no description"
        self.popularity = dictionary["popularity"] as? Int ?? 0
        self.poster_path = dictionary["poster_path"] as? String ?? "no poster"
        self.date = dictionary["release_date"] as? String ?? "no date"
        self.backdrop_path = dictionary["backdrop_path"] as? String ?? "no poster"
        self.id = dictionary["id"] as? Int ?? 0
        self.average = dictionary["vote_average"] as? Double ?? 0
    
    }
    
    func toDictionary() -> [String: AnyObject] {
        return ["title": title, "popularity": popularity, "overview":description, "poster_path":poster_path, "release_date": date, "backdrop_path":backdrop_path,"id":id, "average": average] as [String: AnyObject]
    }
    
    func toggleFavorite() {
        // se invierte el valor del booleano
        // si era true pasa a ser false, y viceversa
        isFavorite = !isFavorite
    }
    
}
