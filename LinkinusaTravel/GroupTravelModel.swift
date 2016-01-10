//
//  GroupTravelModel.swift
//  LinkinusaTravel
//
//  Created by Rean on 1/10/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import Foundation
import Parse

class GroupTravelModel {
    func retrieveData() {
        let query = PFQuery(className:"location")
        //        query.whereKey("playerName", equalTo:"Sean Plott")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                //                print("Successfully retrieved \(objects!.count) locations.")
                if let objects = objects {
                    for object in objects {
                        print(object.objectId)
                    }
//                    self.data = objects
//                    self.tableView.reloadData()
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
}