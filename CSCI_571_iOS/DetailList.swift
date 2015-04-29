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
    
    @IBOutlet var icon1: UIImageView!
    @IBOutlet var icon2: UIImageView!
    @IBOutlet var icon3: UIImageView!
    
    @IBOutlet var FB_btn: FBSDKShareButton!
    
    
    
//    @IBOutlet var fbLoginView: FBLoginView!
    var item_basicInfo = NSDictionary();
    var item_sellerInfo = NSDictionary();
    var item_shippingInfo = NSDictionary();
    
    var button_record = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        FBSDKSharingDelegate.self;
        
        initialization();
        
        displayDetail();
        
        
        var content = FBSDKShareLinkContent();
        var fb_description = "";
        
        fb_description = item_price.text! + ", Location: " + item_location.text!;
        
        content.contentURL = NSURL(string: (item_basicInfo["viewItemURL"] as! String));
        content.contentDescription = fb_description;
        content.imageURL = NSURL(string: (item_basicInfo["galleryURL"] as! String));
     
        if let fb_ttl = item_basicInfo["title"] as? String{
            content.contentTitle = fb_ttl;
        }
       
        FB_btn.shareContent = content;
        
        
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
        var url_str = item_basicInfo["pictureURLSuperSize"] as! String;
        if(url_str == ""){
            let img_url = NSURL(string: (item_basicInfo["galleryURL"] as! String));
            image_url = img_url!;
            if let img_data = NSData(contentsOfURL: image_url){
                item_img.image = UIImage(data: img_data);
                println("b");
            }
        }else{
            if let img_url = NSURL(string: (item_basicInfo["pictureURLSuperSize"] as! String)){
                image_url = img_url;
                if let img_data = NSData(contentsOfURL: image_url){
                    item_img.image = UIImage(data: img_data);
                    println("a");
                }
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
        
        label1.text = "Category Name";
        label2.text = "Condition";
        label3.text = "Buying Format";
        
        label4.text = "";
        label5.text = "";
        label6.text = "";
        
        detail4.text = "";
        detail5.text = "";
        detail6.text = "";
        
        icon1.image = UIImage();
        icon2.image = UIImage();
        icon3.image = UIImage();
        
        if let ctgy = item_basicInfo["categoryName"] as? String{
            detail1.text = ctgy;
        }
        if let cdtn = item_basicInfo["conditionDisplayName"] as? String{
            detail2.text = cdtn;
        }
        if let bfmt = item_basicInfo["listingType"] as? String{
            detail3.text = bfmt;
        }
        
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
        
        /* --- Handle tab display --- */
        
        label1.text = "User Name";
        label2.text = "Feedback Score";
        label3.text = "Positive Feedback";
        label4.text = "Feedback Rating";
        label5.text = "Top Rated";
        label6.text = "Store";
        
        detail5.text = "";
        icon1.image = UIImage();
        icon3.image = UIImage();

        
        if let slun = item_sellerInfo["sellerUserName"] as? String{
            detail1.text = slun;
        }
        if let fbs = item_sellerInfo["feedbackScore"] as? String{
            detail2.text = fbs;
        }
        if let ptf = item_sellerInfo["positiveFeedbackPercent"] as? String{
            detail3.text = ptf;
        }
        if let fbr = item_sellerInfo["feedbackRatingStar"] as? String{
            detail4.text = fbr;
        }
        if let topRS = item_sellerInfo["topRatedSeller"] as? String{
            if(topRS == "false"){
                let topRatedSeller =  UIImage(named:"Pic/wrong.png");
                
                icon2.image = topRatedSeller;
            }else{
                let topRatedSeller =  UIImage(named:"Pic/checked.png");
                
                icon2.image = topRatedSeller;
            }
        }
        if let ssn = item_sellerInfo["sellerStoreName"] as? String{
            if(ssn == ""){
                detail6.text = "N/A";
            }else{
                detail6.text = ssn;
            }
        
        }
        
        

        
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
        
        /* --- Handle tab display --- */
        
        label1.text = "Shipping Type";
        label2.text = "Handling Time";
        label3.text = "Shipping Locations";
        label4.text = "Expedited Shpping";
        label5.text = "One Day Shpping";
        label6.text = "Returns Accepted";
        
        detail4.text = "";
        detail5.text = "";
        detail6.text = "";
        
        if let spt = item_shippingInfo["shippingType"] as? String{
            let strArr = Array(spt);
            var tempStr = "";
            var result = "";

            for(var i = 0; i < strArr.count; i++){
                
                var c = String(strArr[i]);
                while(c.lowercaseString == c){
                    tempStr += c;
                    i++;
                    if(i < strArr.count){
                        c = String(strArr[i]);
                    }else{
                        break;
                    }
                }
                tempStr += "," + c;
            }
            var tempStr1 = (tempStr as NSString).substringFromIndex(1);
            result = (tempStr1 as NSString).substringToIndex(count(tempStr1) - 2);
            
            detail1.text = result;
        }
        if let hdt = item_shippingInfo["handlingTime"] as? String{
            detail2.text = "\(hdt) day(s)";
        }
        if let stl = item_shippingInfo["shipToLocations"] as? String{
            detail3.text = stl;
        }
        if let eps = item_shippingInfo["expeditedShipping"] as? String{
            if(eps == "false"){
                let exShipping =  UIImage(named:"Pic/wrong.png");
                
                icon1.image = exShipping;
            }else{
                let exShipping =  UIImage(named:"Pic/checked.png");
                
                icon1.image = exShipping;
            }
        }
        if let ods = item_shippingInfo["oneDayShippingAvailable"] as? String{
            if(ods == "false"){
                let ondShipping =  UIImage(named:"Pic/wrong.png");
                
                icon2.image = ondShipping;
            }else{
                let ondShipping =  UIImage(named:"Pic/checked.png");
                
                icon2.image = ondShipping;
            }
        }
        if let rtc = item_shippingInfo["returnsAccepted"] as? String{
            if(rtc == "false"){
                let returnAcc =  UIImage(named:"Pic/wrong.png");
                
                icon3.image = returnAcc;
            }else{
                let returnAcc =  UIImage(named:"Pic/checked.png");
                
                icon3.image = returnAcc;
            }
        }
        

        println("shipping");
    }
    
    // Facebook Delegate Methods
    
//    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
//        println("User Logged In")
//    }
//    
//    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
//        println("User: \(user)")
//        println("User ID: \(user.objectID)")
//        println("User Name: \(user.name)")
//        var userEmail = user.objectForKey("email") as! String
//        println("User Email: \(userEmail)")
//    }
//    
//    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
//        println("User Logged Out")
//    }
//
//    func loginView(loginView : FBLoginView!, handleError:NSError) {
//        println("Error: \(handleError.localizedDescription)")
//    }
    
    
    func sharerDidCancel(sharer: AnyObject) -> Void{
        println("cancelled");
    }
    
    
    


    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
