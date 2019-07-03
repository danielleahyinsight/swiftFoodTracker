//
//  ViewController.swift
//  FoodTracker
//
//  Created by daniel leahy on 03/07/2019.
//  Copyright © 2019 ucd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Handle the text fields  user input through delegate callbacks
        nameTextField.delegate = self
    }
    
    
   
    
    
    //MARK: UITextViewDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton)  {
        mealNameLabel.text = "Default Text"
    }
}
