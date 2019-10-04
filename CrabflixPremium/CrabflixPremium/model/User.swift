//
//  User.swift
//  CrabflixPremium
//
//  Created by Luciana Ines Ezcurra on 27/09/2019.
//  Copyright © 2019 Luciana Ines Ezcurra. All rights reserved.
//

import Foundation

class User {

    var id: String
    var nombre: String
    var email: String
    var favFilms: [Film] = []
    
    init(id: String) {
        self.id = id
        self.nombre = ""
        self.email = ""
    }
    
    init(dictionary: [String: AnyObject]) {
        self.id = dictionary["id"] as? String ?? ""
        self.nombre = dictionary["name"] as? String ?? "no name"
        self.email = dictionary["email"] as? String ?? ""
        self.favFilms = []
        if let array = dictionary["favFilms"] as? [[String: AnyObject]] {
            for dic in array {
                self.favFilms.append(Film(dictionary: dic))
            }
        }
      
            }
    
    func toDictionary() -> [String: AnyObject] {
        var result =  ["id": id, "name": nombre, "email": email] as [String: AnyObject]
        if favFilms.count > 0 {
            var arrayFilm: [[String: AnyObject]] = []
            for film in favFilms {
                arrayFilm.append(film.toDictionary())
            }
            result["favFilms"] = arrayFilm as AnyObject
        }
       
        
        return result
    }
}
