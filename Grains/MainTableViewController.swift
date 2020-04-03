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
        // Rate App 
        RateManager.rate()
        navigationController?.navigationBar.alpha = 0.1
    
    
        
        
        
       
       
        setUpSearchBar()
        SetupNavController()
        Model.shared.appendToArr()
        tableView.reloadData()
    
    }
 
    override func viewDidAppear(_ animated: Bool) {
        Model.shared.grainsAllTogether.removeAll()
        Model.shared.appendToArr()
        tableView.reloadData()
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
       // addBackgroundImage()
    }
    
    
    
    
    // MARK:- Search Bar
    
    
    func setUpSearchBar() {
         if #available(iOS 11.0, *) {
               //self.navigationController?.navigationBar.prefersLargeTitles = true
               //self.navigationItem.largeTitleDisplayMode = .automatic
               }
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
//        navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationItem.largeTitleDisplayMode = .automatic
    
        
    }



// MARK: - Filter searchFilter
    var filteredGrains: [Grain] = []
    var grainsAllTogether: [Grain] = Model.shared.grainsAllTogether
    
    
    

       
      //MARK: - function SearchBar
  

    
}
extension MainTableViewController: UISearchBarDelegate{
func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
}


func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        Model.shared.grainsAllTogether.removeAll()
        Model.shared.appendToArr()
        tableView.reloadData()
    }
    
  
    // MARK: - Add BackgroundImg
    func addBackgroundImage() {
           // Add background Image
           let backgroundImage = UIImage(named: "Bgr.png")
           let imageView = UIImageView(image: backgroundImage)
           imageView.alpha = 0.3
           
           imageView.contentMode = UIView.ContentMode.scaleAspectFill
           self.tableView.backgroundView = imageView
       }
}

extension MainTableViewController: UISearchResultsUpdating {
  
    //MARK: - Function of SearchField:
    
    
    func updateSearchResults(for searchController: UISearchController) {
       print (searchController.searchBar.text!)
        if searchController.searchBar.text != nil && searchController.searchBar.text!.count > 2 {  // если в текстовом поле больше 3х букв то:
            
            // Обнуляем прежний массив
            Model.shared.grainsAllTogether.removeAll()
            Model.shared.appendToArr()
            tableView.reloadData()
            
            // перечисляем массив классов круп
           for i in Model.shared.grainsAllTogether {
            
            // перечисляем в классе конкретной крупы массив синонимов
            for keyword in i.keyWords {
            // если синоним совпадает с введенным текстом то обнуляем массив и добавляем в пустой массив эту крупу
                if keyword.contains(searchController.searchBar.text!.lowercased()) {     // i это название класса
                print(i.name)
                
                filteredGrains.append(i)
                    
                tableView.reloadData()
                print ("searchArray: \(filteredGrains.count)")
                //Model.shared.grainsAllTogether.removeAll()
                
                //Model.shared.grainsAllTogether = filteredGrains
                
                
                }
            else {
                  
                
                }
                }
            Model.shared.grainsAllTogether = filteredGrains
            //filteredGrains.removeAll()
            tableView.reloadData()
            }
            tableView.reloadData()
            }
        else if searchController.searchBar.text == ""  {
          Model.shared.grainsAllTogether.removeAll()
            Model.shared.appendToArr()
            tableView.reloadData()

        }
        }
        
        
    
    }
    
        
// commit 1
  
// commit 3



