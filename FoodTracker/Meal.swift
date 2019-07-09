//
//  Meal.swift
//  FoodTracker
//
//  Created by daniel leahy on 05/07/2019.
//  Copyright © 2019 ucd. All rights reserved.
//

import UIKit


class Meal {
    
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialisation
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // The name should not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating should be between 0 and 5 inclusively
        guard (rating >= 0 ) && (rating <= 5) else {
            return nil
        }
        
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
    
 }



