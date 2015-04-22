//
//  DetailList.swift
//  CSCI_571_iOS
//
//  Created by Weiwei Zheng on 4/21/15.
//  Copyright (c) 2015 Weiwei. All rights reserved.
//

import UIKit

class DetailList: UITableViewController {

    @IBOutlet var test_img: UIImageView!
    
    var item_basicInfo = NSDictionary();
    var item_sellerInfo = NSDictionary();
    var item_shippingInfo = NSDictionary();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if var img_url = NSURL(string: (item_basicInfo["pictureURLSuperSize"] as? String)!){
            if(img_url == ""){
                img_url = NSURL(string: (item_basicInfo["galleryURL"] as? String)!)!
            }
            if let img_data = NSData(contentsOfURL: img_url){
                test_img.image = UIImage(data: img_data);
            }
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
