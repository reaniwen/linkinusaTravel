//
//  GroupDetailVC.swift
//  LinkinusaTravel
//
//  Created by Rean on 1/6/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class GroupDetailVC: UIViewController {

    var parseID: String = ""
    var image: UIImage = UIImage()
    var placeText: String = ""
    var priceText: String = ""
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(parseID)
        loadDetail()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDetail() {
        placeLabel.text = placeText
        priceLabel.text = priceText
        imageView.image = image
    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
