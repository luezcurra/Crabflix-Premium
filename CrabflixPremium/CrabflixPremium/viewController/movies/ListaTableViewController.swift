//
//  ListaTableViewController.swift
//  CrabflixPremium
//
//  Created by Luciana Ines Ezcurra on 25/09/2019.
//  Copyright © 2019 Luciana Ines Ezcurra. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

protocol FavoritesDelegate {
    func changeFavoriteStatus(inCell: PeliculasTableViewCell)
}

class ListaTableViewController: UITableViewController, FavoritesDelegate {
    

    var filmsArray: [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filmsService = FilmService()
        filmsService.getFilm {(films) in
            self.filmsArray = films
            self.tableView.reloadData()
        }
    }
    
    func changeFavoriteStatus(inCell: PeliculasTableViewCell) {
        if let position = tableView.indexPath(for: inCell) {
            if position.section == 0 {
                let film = filmsArray[position.row]
                film.toggleFavorite()
                tableView.reloadData()
            } else {
                let film = filmsArray[position.row]
                film.toggleFavorite()
                tableView.reloadData()
            }
        }
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filmsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "films-cell", for: indexPath)
        if let customCell = cell as? PeliculasTableViewCell {
            customCell.setup(film: filmsArray[indexPath.row], delegate: self)
            
        }
        

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detail = segue.destination as? DetailViewController {
            if let selectedPosition = tableView.indexPathForSelectedRow?.row {
                detail.film = filmsArray[selectedPosition]
            }
        }
    }

}
