//
//  CollectionTableViewController.swift
//  Collect
//
//  Created by Andrew R Madsen on 7/21/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class CollectionTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemController.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionItemCell", for: indexPath)

        let item = itemController.items[indexPath.row]
        cell.textLabel?.text = item.name

        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowItemDetail" {
            guard let detailVC = segue.destination as? ItemDetailViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            detailVC.item = itemController.items[indexPath.row]
            detailVC.itemController = itemController
        }
        
        if segue.identifier == "AddItem" {
            guard let detailVC = segue.destination as? ItemDetailViewController else { return }
            detailVC.itemController = itemController
        }
    }
    

    // MARK: Properties
    
    let itemController = ItemController()
}
