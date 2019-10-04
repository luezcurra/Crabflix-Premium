//
//  DetailViewController.swift
//  CrabflixPremium
//
//  Created by Luciana Ines Ezcurra on 30/09/2019.
//  Copyright © 2019 Luciana Ines Ezcurra. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    let imageStringDefault: String = "https://image.tmdb.org/t/p/w500"
   
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descriptionTxt: UILabel!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    
    var film: Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageLogo.image = UIImage(named: "logo")
        title = "Detail"
        playButton.layer.cornerRadius = 5
        playButton.layer.borderWidth = 1

        if let film = film {
            let url = URL(string: imageStringDefault + "\(film.backdrop_path)")
            filmImageView.kf.setImage(with: url)
            nameLabel.text = film.title
            descriptionTxt.text = film.description
            
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-mm-dd"
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "mm-yyyy"
            
            if let date = dateFormatterGet.date(from: film.date) {
                yearLabel.text = dateFormatterPrint.string(from: date)
            } else {
                yearLabel.text = "Unknown"
            }
        }
        
        
    }
    
    @IBAction func repFilm(_ sender: Any) {
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "player") as? TrailerViewController {
            detailViewController.movieID = film?.id
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    

}
