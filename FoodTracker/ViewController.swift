//
//  ViewController.swift
//  FoodTracker
//
//  Created by daniel leahy on 03/07/2019.
//  Copyright © 2019 ucd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton)  {
        mealNameLabel.text = "Default Text"
    }
}

