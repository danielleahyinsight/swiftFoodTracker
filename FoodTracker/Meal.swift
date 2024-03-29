//
//  Meal.swift
//  FoodTracker
//
//  Created by daniel leahy on 05/07/2019.
//  Copyright © 2019 ucd. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {

    //MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Archiving paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    //MARK: Types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
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
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name,forKey: PropertyKey.name)
        aCoder.encode(photo,forKey: PropertyKey.photo)
        aCoder.encode(rating,forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a meal object", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional case.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        // Must call designated initializer
        self.init(name: name, photo: photo, rating: rating)
    }
    
 }



