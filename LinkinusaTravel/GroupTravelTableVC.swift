//
//  GroupTravelTableVC.swift
//  LinkinusaTravel
//
//  Created by Rean on 1/1/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit
import Parse

class GroupTravelTableVC: UITableViewController {
    
    let olddata = ["foo", "bar", "swift"]
    var data = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // retrieve data
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
                    self.data = objects
                    self.tableView.reloadData()
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
        
        let screenWidth  = UIScreen.mainScreen().fixedCoordinateSpace.bounds.width
//        let screenHeight = UIScreen.mainScreen().fixedCoordinateSpace.bounds.height
//        self.tableView.estimatedRowHeight = 140.0
//        self.tableView.rowHeight = 140
        self.tableView.rowHeight = screenWidth * 9 / 21
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        // These two both works
        let cell:GroupTravelTableViewCell = tableView.dequeueReusableCellWithIdentifier("GroupCell", forIndexPath: indexPath) as! GroupTravelTableViewCell
//        let cell: CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomTableViewCell

        // Configure the cell...
        let title = self.data[indexPath.row]["city"] as! String
        let price = self.data[indexPath.row]["price"] as! String
        let imageFile = self.data[indexPath.row]["photo"] as! PFFile
        
        
        cell.loadItem(title: title, price: price, imageFile: imageFile)

        return cell
    }
    
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        <#code#>
//    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "GroupDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destinationViewController as! GroupDetailVC
//                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! GroupDetailVC
                controller.parseID = self.data[indexPath.row].objectId!
                let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! GroupTravelTableViewCell
                controller.image = cell.backgroundImage.image!
                controller.placeText = cell.titleLabel.text!
                controller.priceText = cell.priceLabel.text!
            }
        }
    }


}
