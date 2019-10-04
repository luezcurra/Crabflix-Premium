//
//  FilmDAO.swift
//  CrabflixPremium
//
//  Created by Luciana Ines Ezcurra on 26/09/2019.
//  Copyright © 2019 Luciana Ines Ezcurra. All rights reserved.
//

import Foundation
import Alamofire

class FilmDAO {
    
    func getProductFromAPI(daoCompleted: @escaping (([Film]) -> Void)) -> Void {
        
        Alamofire.request("https://api.themoviedb.org/3/movie/popular?api_key=db898f2be5d80aee6fee0407b549ec39").responseJSON { (response) in
            
            if let rootArray = response.value as? [String: AnyObject] {
                 var filmsResultArray: [Film] = []
                if let array = rootArray["results"] as? [[String: AnyObject]] {
                for aDictionary in array {
                    let aFilmObject = Film(dictionary: aDictionary)
                    filmsResultArray.append(aFilmObject)
                }
            }
                daoCompleted(filmsResultArray)
    
        }
    }
}
    
    func search(query: String, daoCompleted: @escaping(([Film])-> Void)) -> Void {
        
        let parameters = ["query": query]
        
        Alamofire.request("https://api.themoviedb.org/3/search/movie?api_key=db898f2be5d80aee6fee0407b549ec39&language=en-US&query=", parameters: parameters).responseJSON { (response) in
            
            if let rootDictionary = response.value as? [String: AnyObject]{
                if let results = rootDictionary["results"] as? [[String: AnyObject]] {
                    var filmsResultArray: [Film] = []
                    for aDictionary in results {
                        let aFilmObject = Film(dictionary: aDictionary)
                        filmsResultArray.append(aFilmObject)
                    }
                    
                    daoCompleted(filmsResultArray)
                    
                }
                
            }
        }
    }
        
        func searchTrailer(movieID: Int, daoCompleted: @escaping (([Trailer]) -> Void) ) -> Void {
            
            let parameters = ["id": movieID]
            
            Alamofire.request("https://api.themoviedb.org/3/movie/" + String(movieID) + "/videos?api_key=db898f2be5d80aee6fee0407b549ec39&language=en-US", parameters: parameters).responseJSON { (response) in
                
                if let data = response.data {
                    let json = String(data: data, encoding:String.Encoding.utf8)
                    print("Failure response: \(String(describing: json))")
                }
                
                if let rootDictionary = response.value as? [String: AnyObject]{
                    if let results = rootDictionary["results"] as? [[String: AnyObject]] {
                        var trailerResultArray:[Trailer] = []
                        for aDictionary in results {
                            let aTrailerObject = Trailer(dictionary: aDictionary)
                            trailerResultArray.append(aTrailerObject)
                        }
                        daoCompleted(trailerResultArray)
                    }
                }
            }
        }
        
        
    
    
    
    
}
