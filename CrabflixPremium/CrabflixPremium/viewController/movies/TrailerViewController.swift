//
//  TrailerViewController.swift
//  CrabflixPremium
//
//  Created by Luciana Ines Ezcurra on 01/10/2019.
//  Copyright © 2019 Luciana Ines Ezcurra. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class TrailerViewController: UIViewController {

    
    @IBOutlet weak var youtubePlayer: YTPlayerView!
    
    var movieID: Int?
    var trailers: [Trailer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let filmsService = FilmService()
        filmsService.searchTrailer(movieID: movieID) { (trailers) in
            self.trailers = trailers
            let idTrailer = self.trailers[0].key
            self.youtubePlayer.load(withVideoId: idTrailer)
       
    }

 }
}
