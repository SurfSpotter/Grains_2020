//
//  FavouritesTableViewController.swift
//  Grains
//
//  Created by Алексей Чигарских on 13.02.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class FavouritesTableViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        Model.shared.getUsDefToFavArr()
    }

     // MARK: - Table view data source

       override func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return Model.shared.favGrains.count
          
       }

       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! FavTableViewCell
           let cellForGrains = Model.shared.favGrains[indexPath.row]
           cell.initCell(grain: cellForGrains)
           return cell
           
       }

    override func viewDidAppear(_ animated: Bool) {
        Model.shared.getUsDefToFavArr()
        tableView.reloadData()
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDescrip", sender: self)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDescrip" {
            let selectedCellIndexRow = tableView.indexPathForSelectedRow?.row
            (segue.destination as! DescriptionViewController).descriptionGrainClass = Model.shared.favGrains [selectedCellIndexRow ?? 0]
        }
    }
}
