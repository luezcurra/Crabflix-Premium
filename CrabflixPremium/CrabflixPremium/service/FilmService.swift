//
//  FilmService.swift
//  CrabflixPremium
//
//  Created by Luciana Ines Ezcurra on 26/09/2019.
//  Copyright © 2019 Luciana Ines Ezcurra. All rights reserved.
//

import Foundation

class FilmService {
    
    func getFilm(serviceCompleted: @escaping(([Film])) -> Void) -> Void {
        let filmsDao = FilmDAO()
        filmsDao.getProductFromAPI { (response) in
            serviceCompleted(response)
        }
   }
    
    func search(query: String?, daoCompleted: @escaping (([Film]) -> Void)) -> Void {
        if let aQuery = query {
            let filmsDao = FilmDAO()
            filmsDao.search(query: aQuery) { (response) in
                daoCompleted(response)
            }
            }
        }
    
    func searchTrailer(movieID: Int?, daoCompleted: @escaping (([Trailer]) -> Void)) -> Void {
        if let aKey = movieID {
            let filmsDao = FilmDAO()
            filmsDao.searchTrailer(movieID: aKey) { (trailers) in
                daoCompleted(trailers)
        }
      }
    
    }
    
}

