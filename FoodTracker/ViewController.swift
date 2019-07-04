//
//  ViewController.swift
//  FoodTracker
//
//  Created by daniel leahy on 03/07/2019.
//  Copyright © 2019 ucd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
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
    
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user cancelled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following \(info)")
        }
        
        photoImageView.image = selectedImage
        
        //Dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton)  {
        mealNameLabel.text = "Default Text"
    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure the ViewController is notified when the user picks an image
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
        
        
        
        
    }
}
