//
//  FavoritesTableViewCell.swift
//  CrabflixPremium
//
//  Created by Luciana Ines Ezcurra on 03/10/2019.
//  Copyright © 2019 Luciana Ines Ezcurra. All rights reserved.
//

import UIKit
import Kingfisher
import FirebaseAuth
import FirebaseDatabase

protocol TapDelegate {
    func tappedUnfav(film: Film?, serie: Serie?)
}

class FavoritesTableViewCell: UITableViewCell {

     let imageStringDefault: String = "https://image.tmdb.org/t/p/w500"
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratedLabel: UILabel!
    @IBOutlet weak var unFavButton: UIButton!
    
    var film: Film?
    
    
    var buttonDelegate: TapDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

  
}
