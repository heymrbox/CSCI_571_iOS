//
//  DetailList.swift
//  CSCI_571_iOS
//
//  Created by Weiwei Zheng on 4/21/15.
//  Copyright (c) 2015 Weiwei. All rights reserved.
//

import UIKit

class DetailList: UITableViewController {

    @IBOutlet var item_img: UIImageView!
    
    @IBOutlet var item_title: UILabel!
    
    @IBOutlet var item_price: UILabel!
    
    @IBOutlet var item_location: UILabel!
    
    @IBOutlet var topRated_img: UIImageView!
    
    @IBOutlet var buyNow_btn: UIButton!
    
    @IBOutlet var FB_btn: UIButton!
    
    var item_basicInfo = NSDictionary();
    var item_sellerInfo = NSDictionary();
    var item_shippingInfo = NSDictionary();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        displayDetail();
    }
    
    func displayDetail(){
        
        /* ---  Display image --- */
        
        if var img_url = NSURL(string: (item_basicInfo["pictureURLSuperSize"] as? String)!){
            if(img_url == ""){
                img_url = NSURL(string: (item_basicInfo["galleryURL"] as? String)!)!
            }
            if let img_data = NSData(contentsOfURL: img_url){
                item_img.image = UIImage(data: img_data);
            }
        }
        
        /* --- Display title --- */
        if let ttl = item_basicInfo["title"] as? String{
            item_title.text? = ttl;
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
