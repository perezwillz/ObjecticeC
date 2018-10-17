//
//  ItemDetailViewController.swift
//  Collect
//
//  Created by Andrew R Madsen on 7/21/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func save(_ sender: Any) {
        
        let name = itemTextField.text ?? "Unknown Item"
        let value: Int?
        if let valueString = valueTextField.text {
            value = Int(valueString)
        } else {
            value = nil
        }
        
        let location = locationTextField.text
        
        if let existingItem = item {
            itemController.update(item: existingItem, withName: name, value: value, location: location)
        } else {
            item = itemController.createNewItem(withName: name, value: value, location: location)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Private
    
    private func updateViews() {
        guard let item = item, isViewLoaded else { return }
        itemTextField.text = item.name
        if let value = item.value {
            valueTextField.text = String(value)
        } else {
            valueTextField.text = nil
        }
        
        locationTextField.text = item.location
    }
    
    // MARK: Properties
    
    var item: Item? {
        didSet {
            updateViews()
        }
    }
    
    var itemController: ItemController!
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
}
