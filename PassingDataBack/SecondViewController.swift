//
//  SecondViewController.swift
//  PassingDataBack
//
//  Created by Iavor Dekov on 7/16/16.
//  Copyright © 2016 Iavor Dekov. All rights reserved.
//

import UIKit

protocol SecondViewControllerProtocol: class {
    func dismissSecondViewController()
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    weak var delegate: SecondViewControllerProtocol?
    
    var data: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let model = data {
            dataLabel.text = model.items.description
        }
    }
    
    @IBAction func addItemToDataArray(sender: UIButton) {
        if let model = data {
            model.items.append(model.items.count)
            dataLabel.text = model.items.description
        }
        
    }
    
    @IBAction func dismissSelf(sender: UIButton) {
        delegate?.dismissSecondViewController()
    }

    @IBAction func removeItemFromDataArray(sender: UIButton) {
        if let model = data {
            model.items.removeLast()
            dataLabel.text = model.items.description
        }
    }
}
