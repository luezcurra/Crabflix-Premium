//
//  PeliculasTableViewCell.swift
//  CrabflixPremium
//
//  Created by Luciana Ines Ezcurra on 25/09/2019.
//  Copyright © 2019 Luciana Ines Ezcurra. All rights reserved.
//

import UIKit
import Kingfisher
import FirebaseAuth
import FirebaseDatabase

class PeliculasTableViewCell: UITableViewCell {

    let imagenStringDefault: String = "https://image.tmdb.org/t/p/w500"
    @IBOutlet weak var peliculaImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratedLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var favButton: UIButton!
    
    
    var film: Film?
    var user: User?
    
    var favoritesDelegate: FavoritesDelegate?
    
    
    func setup(film: Film, delegate: FavoritesDelegate) {
        self.film = film
        let url = URL(string: imagenStringDefault + "\(film.poster_path)")
        peliculaImageView.kf.setImage(with: url)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        
        let str = film.date
        let index: String.Index = str.index(str.startIndex, offsetBy: 4)
        yearLabel.text = "(" + str.substring(to: index) + ")"
        
        favoritesDelegate = delegate
        ratedLabel.text = String(film.average)
        starImage.image = UIImage(named: "star")
        nameLabel.text = film.title
        if film.isFavorite == true {
            self.favButton.isSelected = true
        } else {
            self.favButton.isSelected = false
        }
    }
    
    
    @IBAction func favTap(_ sender: Any) {
        let ref = Database.database().reference()
        
        //ahora quiero obtener todo el noso "users", recibir array, y cada elemento sera un diccionariorepresentando un user
        if let uid = Auth.auth().currentUser?.uid {
            ref.child("users").child(uid).observeSingleEvent(of: DataEventType.value) { (snapshot) in
                var  user: User
                if let usersDictionary = snapshot.value as? [String: AnyObject]{
                    // el usuario existe
                    user = User(dictionary: usersDictionary)
                    user.id = uid
                } else {
                    //no existe
                    user = User(id: uid)
                    }
                // el usuario existe
                if let film = self.film {
                    var repeated = true
                    
                    if user.favFilms.count > 0 {
                        for aFilm in user.self.favFilms {
                            if aFilm.id != film.id {
                                repeated = false
                                aFilm.isFavorite = true
                                self.favoritesDelegate?.changeFavoriteStatus(inCell: self)
                            } else {
                                repeated = true
                                aFilm.isFavorite = false
                                self.favoritesDelegate?.changeFavoriteStatus(inCell: self)
                                break
                            }
                        }
                    } else {
                        repeated = false
                    }
                    if repeated == false {
                        user.favFilms.append(film)
                    ref.child("users").child(uid).setValue(user.toDictionary())
                    }
                    
                }
            }
            
        }
        
    }
    
    
}
