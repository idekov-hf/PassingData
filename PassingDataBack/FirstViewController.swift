//
//  ViewController.swift
//  PassingDataBack
//
//  Created by Iavor Dekov on 7/16/16.
//  Copyright © 2016 Iavor Dekov. All rights reserved.
//

import UIKit

class Model {
    
    var items = [Int]()
    
    init (value: Int) {
        items.append(value)
    }
    
}

class FirstViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    var data: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = Model(value: 0)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let dataArray = data?.items {
            dataLabel.text = dataArray.description
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationViewController = segue.destinationViewController as? SecondViewController {
            destinationViewController.delegate = self
            destinationViewController.data = data
        }
    }

    @IBAction func printData(sender: UIButton) {
        
        if let dataArray = data?.items {
            print(dataArray.description)
        }
    }
    
    @IBAction func addItemToDataArray(sender: UIButton) {
        if let model = data {
            model.items.append(model.items.count)
            dataLabel.text = model.items.description
        }
    }

    @IBAction func removeItemToDataArray(sender: UIButton) {
        if let model = data {
            model.items.removeLast()
            dataLabel.text = model.items.description
        }
    }
}

extension FirstViewController: SecondViewControllerProtocol {
    func dismissSecondViewController() {
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }
}