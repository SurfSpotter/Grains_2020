//
//  MainTableViewController.swift
//  Grains
//
//  Created by Алексей Чигарских on 04.02.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, UISearchControllerDelegate {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchBar()
        SetupNavController()
        Model.shared.appendToArr()
        tableView.reloadData()
    
    }
 
    
    
    
    
    
    
    
    
    
    // MARK:- Search Bar
    
    
    func setUpSearchBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Введите название"
        searchController.searchBar.delegate = self
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.grainsAllTogether.count
       
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MainTableViewCell
        let cellForGrains = Model.shared.grainsAllTogether[indexPath.row]
        cell.initCell(grain: cellForGrains)
        return cell
        
    }

 // Segue
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDesctription", sender: self)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDesctription" {
            let selectedCellIndexRow = tableView.indexPathForSelectedRow?.row
            (segue.destination as! DescriptionViewController).descriptionGrainClass = Model.shared.grainsAllTogether[selectedCellIndexRow ?? 0]
        }
    }
   
 // Navigation Controller Settings
    
    
    func SetupNavController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }



// MARK: - Filter searchFilter
    var filteredGrains: [Grain] = []
    var grainsAllTogether: [Grain] = Model.shared.grainsAllTogether
    
    
    
//   extension ViewController: UISearchBarDelegate {
//       func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//           inputTextInSearchField = searchText
//           searchAndInsertIntoArray()
//           tableViewAfterEraseSearchBarToDefuault()
//           safetyInputInSearchBarWithMistakes()
//       }
       
      //MARK: - function SearchBar
  
//    func filterContent(searchText: String) {
//        filteredGrains = grainsAllTogether.filter({ (Grain) -> Bool in
//            let keyWordMatch = Grain.name.range(of: searchText)
//            return keyWordMatch != nil
//        })
//
//    }
    
}
extension MainTableViewController: UISearchBarDelegate{
func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
}
    
    
}

extension MainTableViewController: UISearchResultsUpdating {
  
    
    func updateSearchResults(for searchController: UISearchController) {
//    if let searchText = searchController.searchBar.text {
//        filterContent(searchText: searchText)
//        tableView.reloadData()
//        print ("filtered")
//        print (filteredGrains.count)
    }
        

  }

