//
//  ParseTest.swift
//  LinkinusaTravel
//
//  Created by Rean on 1/4/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import Foundation
import Parse

class ParseFunctions{
    
    var parseClass: String
    
    init(parseClass: String) {
        self.parseClass = parseClass
    }
    
    
    // Add data
    func addData(datas:[(key:String, val: String)]) {
        let targetObject = PFObject(className: parseClass)
        
        for (key, val) in datas {
            targetObject[key] = val
        }
//        testObject["testkey1"] = data
//        testObject["key2"] = "val2"
        
        targetObject.saveInBackgroundWithBlock { (success, error) -> Void in
            if success == true {
                print("success")
            } else {
                print(error)
            }
        }
    }
    
    // Get data
    func getData(objID: String) {
        let query = PFQuery(className: parseClass)
        query.getObjectInBackgroundWithId(objID) { (object, error) -> Void in
            if error != nil {
                print(error)
            } else {
            
                let val = object?.objectForKey("testkey1")
                print("\(val)")
                
                // or
                
                print(object!.objectForKey("testkey1"))
            }
        }
    }
    
    // Update data
    func updateData(objID: String,key:String, newVal:String) {
        let query = PFQuery(className: "testObject")
        query.getObjectInBackgroundWithId(objID) { (object: PFObject?, error: NSError? ) -> Void in
            if error != nil {
                print(error)
            } else if let product = object {
                product[key] = newVal
                
                product.saveInBackground()
            }
        }
    }
    
}
