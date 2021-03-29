//
//  FavouritesTableViewController.swift
//  Grains
//
//  Created by Алексей Чигарских on 13.02.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class FavouritesTableViewController: UITableViewController {
    @IBOutlet var emptyView: UIView!
    @IBOutlet var ifEmpyLabel: UILabel!
    @IBOutlet var ImgIfEmptyOut: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        Model.shared.getUsDefToFavArr()
        navigationController?.navigationBar.alpha = 0.3
        messIfFavEmpty()

//        if #available(iOS 11.0, *) {
//               self.navigationController?.navigationBar.prefersLargeTitles = true
//            self.navigationItem.largeTitleDisplayMode = .always
//               }
    }

    override func viewWillAppear(_: Bool) {
        // addBackgroundImage()
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return Model.shared.favGrains.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! FavTableViewCell
        let cellForGrains = Model.shared.favGrains[indexPath.row]
        cell.initCell(grain: cellForGrains)
        return cell
    }

    override func viewDidAppear(_: Bool) {
        Model.shared.getUsDefToFavArr()
        messIfFavEmpty()
        tableView.reloadData()
    }

    override func tableView(_: UITableView, didSelectRowAt _: IndexPath) {
        performSegue(withIdentifier: "goToDescrip", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "goToDescrip" {
            let selectedCellIndexRow = tableView.indexPathForSelectedRow?.row
            (segue.destination as! DescriptionViewController).descriptionGrainClass = Model.shared.favGrains[selectedCellIndexRow ?? 0]
        }
    }

    // Write message is table is Empty
    fileprivate func messIfFavEmpty() {
        ifEmpyLabel.isHidden = true
        ImgIfEmptyOut.isHidden = true
        tableView.isScrollEnabled = true
        tableView.backgroundView?.alpha = 0.3
        if Model.shared.favGrains.isEmpty {
            ifEmpyLabel.isHidden = false
            ImgIfEmptyOut.isHidden = false
            tabBarController?.tabBar.alpha = 0.9
            navigationController?.navigationBar.alpha = 0.9
            tableView.isScrollEnabled = false
            tableView.backgroundView?.alpha = 0.3
        }
    }

    // MARK: - Add BackgroundImg

    func addBackgroundImage() {
        // Add background Image
        let backgroundImage = UIImage(named: "Bgr.png")
        let imageView = UIImageView(image: backgroundImage)
        imageView.alpha = 0.3

        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        tableView.backgroundView = imageView
    }
}
