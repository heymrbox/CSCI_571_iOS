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
    
    @IBOutlet var basicInfo_btn: UIButton!
    @IBOutlet var sellerInfo_btn: UIButton!
    @IBOutlet var shippingInfo_btn: UIButton!
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var detail1: UILabel!
    
    @IBOutlet var label2: UILabel!
    @IBOutlet var detail2: UILabel!
    
    @IBOutlet var label3: UILabel!
    @IBOutlet var detail3: UILabel!
    
    @IBOutlet var label4: UILabel!
    @IBOutlet var detail4: UILabel!
    
    @IBOutlet var label5: UILabel!
    @IBOutlet var detail5: UILabel!
    
    @IBOutlet var label6: UILabel!
    @IBOutlet var detail6: UILabel!
    
    var item_basicInfo = NSDictionary();
    var item_sellerInfo = NSDictionary();
    var item_shippingInfo = NSDictionary();
    
    var button_record = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        initialization();
        
        displayDetail();
    }
    
    func initialization(){
        label1.text = "";
        detail1.text = "";
        
        label2.text = "";
        detail2.text = "";
        
        label3.text = "";
        detail3.text = "";
        
        label4.text = "";
        detail4.text = "";
        
        label5.text = "";
        detail5.text = "";
        
        label6.text = "";
        detail6.text = "";
        
        
        buyNow_btn.selected = false;
        buyNow_btn.addTarget(self, action: "redirectToWeb", forControlEvents: UIControlEvents.TouchUpInside);
        
        basicInfo_btn.selected = true;
        basicInfo_btn.addTarget(self, action: "basicInfoClicked", forControlEvents: UIControlEvents.TouchUpInside);
        
        sellerInfo_btn.selected = false;
        sellerInfo_btn.addTarget(self, action: "sellerInfoClicked", forControlEvents: UIControlEvents.TouchUpInside);
        
        shippingInfo_btn.selected = false;
        shippingInfo_btn.addTarget(self, action: "shippingInfoClicked", forControlEvents: UIControlEvents.TouchUpInside);
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
        
        /* --- Display the default tab --- */
        
        label1.text = "Category Name";
        label2.text = "Condition";
        label3.text = "Buying Format";
        
        if let ctgy = item_basicInfo["categoryName"] as? String{
            detail1.text = ctgy;
        }
        if let cdtn = item_basicInfo["conditionDisplayName"] as? String{
            detail2.text = cdtn;
        }
        if let bfmt = item_basicInfo["listingType"] as? String{
            detail3.text = bfmt;
        }
  
    }
    
    
    func redirectToWeb(){
        buyNow_btn.selected = true;
        
        if let url = item_basicInfo["viewItemURL"] as? String{
            UIApplication.sharedApplication().openURL(NSURL(string: url)!);
        }
    }
    
    func basicInfoClicked(){
        /* ---  Handle UI for button --- */
        
        basicInfo_btn.selected = true;
        
        switch(button_record){
        case 2:
            sellerInfo_btn.selected = false;
            break;
        case 3:
            shippingInfo_btn.selected = false;
            break;
        default:
            break;
        }
        
        button_record = 1;

        /* --- Handle tab display --- */
        
        
        
        println("basic");
    }
    
    func sellerInfoClicked(){
        /* ---  Handle UI for button --- */

        sellerInfo_btn.selected = true;

        switch(button_record){
        case 1:
            basicInfo_btn.selected = false;
            break;
        case 3:
            shippingInfo_btn.selected = false;
            break;
        default:
            break;
        }
        
        button_record = 2;

        
        println("seller");
    }
    
    func shippingInfoClicked(){
        /* ---  Handle UI for button --- */

        shippingInfo_btn.selected = true;

        switch(button_record){
        case 1:
            basicInfo_btn.selected = false;
            break;
        case 2:
            sellerInfo_btn.selected = false;
            break;
        default:
            break;
        }
        
        button_record = 3;

        println("shipping");
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
