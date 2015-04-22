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
        
        buyNow_btn.addTarget(self, action: "redirectToWeb", forControlEvents: UIControlEvents.TouchUpInside);
        
        displayDetail();
    }
    
    func displayDetail(){
        
        /* ---  Display image --- */
        var image_url = NSURL();
        
        if let img_url = NSURL(string: (item_basicInfo["pictureURLSuperSize"] as? String)!){
            
            if(img_url == ""){
                image_url = NSURL(string: (item_basicInfo["galleryURL"] as? String!)!)!;
            }else{
                image_url = img_url;
            }
            if let img_data = NSData(contentsOfURL: image_url){
                item_img.image = UIImage(data: img_data);
            }
        }
        
        /* --- Display title --- */
        if let ttl = item_basicInfo["title"] as? String{
            item_title.text? = ttl;
        }
        
        /* --- Display price --- */
        if let prc = item_basicInfo["convertedCurrentPrice"] as? String{
            var price_detail = "";
            var shippingServiceCost = "";
            var shippingType = "";
            
            if let shippingServiceCost_msg : AnyObject = item_basicInfo["shippingServiceCost"]{
                shippingServiceCost = shippingServiceCost_msg as! String;
            }
            if let shippingType_msg : AnyObject = item_shippingInfo["shippingType"]{
                shippingType = shippingType_msg as! String;
            }
            
            if(shippingServiceCost == "0.0" || shippingType == "Free" || shippingServiceCost == ""){
                price_detail = "(FREE Shipping)";
            }else{
                price_detail = "(+ $\(shippingServiceCost) Shipping)";
            }
            
            item_price.text = "Price: $\(prc) \(price_detail)";
        }
        
        /* --- Display location --- */
        if let loc = item_basicInfo["location"] as? String{
            item_location.text = loc;
        }
        
        /* --- Handle topRated img --- */
        if let topR = item_basicInfo["topRatedListing"] as? String{
            if(topR == "true"){
                let topRated =  UIImage(named:"Pic/itemTopRated.jpg");
                
                topRated_img.image = topRated;
            }else{
                println("Not top rated");
            }
        }
        
  
    }
    
    
    func redirectToWeb(){
        if let url = item_basicInfo["viewItemURL"] as? String{
            UIApplication.sharedApplication().openURL(NSURL(string: url)!);
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
