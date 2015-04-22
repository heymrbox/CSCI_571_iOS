//
//  ResultList.swift
//  CSCI_571_iOS
//
//  Created by Weiwei Zheng on 4/20/15.
//  Copyright (c) 2015 Weiwei. All rights reserved.
//

import UIKit


class ResultList: UITableViewController {

    
    @IBOutlet var resultHeader: UILabel!
    
    @IBOutlet var img_item0: UIImageView!
    @IBOutlet var img_item1: UIImageView!
    @IBOutlet var img_item2: UIImageView!
    @IBOutlet var img_item3: UIImageView!
    @IBOutlet var img_item4: UIImageView!

    @IBOutlet var title_item0: UILabel!
    @IBOutlet var title_item1: UILabel!
    @IBOutlet var title_item2: UILabel!
    @IBOutlet var title_item3: UILabel!
    @IBOutlet var title_item4: UILabel!
    
    @IBOutlet var price_item0: UILabel!
    @IBOutlet var price_item1: UILabel!
    @IBOutlet var price_item2: UILabel!
    @IBOutlet var price_item3: UILabel!
    @IBOutlet var price_item4: UILabel!
    
    
    @IBOutlet var backButton: UIButton!
    
    
    var response = NSDictionary();
    var resultKeyword = "";
    var url_images = Array(count: 5, repeatedValue: "");
    var bridge = Array(count: 15, repeatedValue: NSDictionary());
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        initialization();
        
        
        
        parseJSON(response);
        
    }
    
    func initialization(){
        title_item0.numberOfLines = 4;
        title_item1.numberOfLines = 4;
        title_item2.numberOfLines = 4;
        title_item3.numberOfLines = 4;
        title_item4.numberOfLines = 4;
        
        title_item0.font = title_item0.font.fontWithSize(12);
        title_item1.font = title_item1.font.fontWithSize(12);
        title_item2.font = title_item2.font.fontWithSize(12);
        title_item3.font = title_item3.font.fontWithSize(12);
        title_item4.font = title_item4.font.fontWithSize(12);
    
        price_item0.font = price_item0.font.fontWithSize(13);
        price_item1.font = price_item1.font.fontWithSize(13);
        price_item2.font = price_item2.font.fontWithSize(13);
        price_item3.font = price_item3.font.fontWithSize(13);
        price_item4.font = price_item4.font.fontWithSize(13);
  
    }
    
    func parseJSON(response: NSDictionary){
        
        resultHeader.text = "Results for '" + resultKeyword + "'";
        
        var item0: AnyObject;
        var item1: AnyObject;
        var item2: AnyObject;
        var item3: AnyObject;
        var item4: AnyObject;
        
        
        var item0_basicInfo: AnyObject;
        var item1_basicInfo: AnyObject;
        var item2_basicInfo: AnyObject;
        var item3_basicInfo: AnyObject;
        var item4_basicInfo: AnyObject;
        
        
        var item0_sellerInfo: AnyObject;
        var item1_sellerInfo: AnyObject;
        var item2_sellerInfo: AnyObject;
        var item3_sellerInfo: AnyObject;
        var item4_sellerInfo: AnyObject;
        
        var item0_shippingInfo: AnyObject;
        var item1_shippingInfo: AnyObject;
        var item2_shippingInfo: AnyObject;
        var item3_shippingInfo: AnyObject;
        var item4_shippingInfo: AnyObject;
        
        item0 = response["item0"]! as! NSDictionary;
        item1 = response["item1"]! as! NSDictionary;
        item2 = response["item2"]! as! NSDictionary;
        item3 = response["item3"]! as! NSDictionary;
        item4 = response["item4"]! as! NSDictionary;
        
        
        item0_basicInfo = item0["basicInfo"]! as! NSDictionary;
        item1_basicInfo = item1["basicInfo"]! as! NSDictionary;
        item2_basicInfo = item2["basicInfo"]! as! NSDictionary;
        item3_basicInfo = item3["basicInfo"]! as! NSDictionary;
        item4_basicInfo = item4["basicInfo"]! as! NSDictionary;
        
        
        item0_sellerInfo = item0["sellerInfo"]! as! NSDictionary;
        item1_sellerInfo = item1["sellerInfo"]! as! NSDictionary;
        item2_sellerInfo = item2["sellerInfo"]! as! NSDictionary;
        item3_sellerInfo = item3["sellerInfo"]! as! NSDictionary;
        item4_sellerInfo = item4["sellerInfo"]! as! NSDictionary;
        
        
        item0_shippingInfo = item0["shippingInfo"]! as! NSDictionary;
        item1_shippingInfo = item1["shippingInfo"]! as! NSDictionary;
        item2_shippingInfo = item2["shippingInfo"]! as! NSDictionary;
        item3_shippingInfo = item3["shippingInfo"]! as! NSDictionary;
        item4_shippingInfo = item4["shippingInfo"]! as! NSDictionary;
        
        bridge[0] = item0_basicInfo as! NSDictionary;
        bridge[1] = item0_sellerInfo as! NSDictionary;
        bridge[2] = item0_shippingInfo as! NSDictionary;
        
        bridge[3] = item1_basicInfo as! NSDictionary;
        bridge[4] = item1_sellerInfo as! NSDictionary;
        bridge[5] = item1_shippingInfo as! NSDictionary;

        bridge[6] = item2_basicInfo as! NSDictionary;
        bridge[7] = item2_sellerInfo as! NSDictionary;
        bridge[8] = item2_shippingInfo as! NSDictionary;
        
        bridge[9] = item3_basicInfo as! NSDictionary;
        bridge[10] = item3_sellerInfo as! NSDictionary;
        bridge[11] = item3_shippingInfo as! NSDictionary;
        
        bridge[12] = item4_basicInfo as! NSDictionary;
        bridge[13] = item4_sellerInfo as! NSDictionary;
        bridge[14] = item4_shippingInfo as! NSDictionary;
        
        
        /* =========== Display titles for items (5) =========== */
        
        let title0 = UITapGestureRecognizer(target: self, action: "titleTab0:");
        let title1 = UITapGestureRecognizer(target: self, action: "titleTab1:");
        let title2 = UITapGestureRecognizer(target: self, action: "titleTab2:");
        let title3 = UITapGestureRecognizer(target: self, action: "titleTab3:");
        let title4 = UITapGestureRecognizer(target: self, action: "titleTab4:");
        
        if let itm0_ttl = item0_basicInfo["title"] as? String{
            title_item0.text = itm0_ttl;
            title_item0!.addGestureRecognizer(title0);
            title_item0!.userInteractionEnabled = true;
        }
        if let itm1_ttl = item1_basicInfo["title"] as? String{
            title_item1.text = itm1_ttl;
            title_item1!.addGestureRecognizer(title1);
            title_item1!.userInteractionEnabled = true;

        }
        if let itm2_ttl = item2_basicInfo["title"] as? String{
            title_item2.text = itm2_ttl;
            title_item2!.addGestureRecognizer(title2);
            title_item2!.userInteractionEnabled = true;

        }
        if let itm3_ttl = item3_basicInfo["title"] as? String{
            title_item3.text = itm3_ttl;
            title_item3!.addGestureRecognizer(title3);
            title_item3!.userInteractionEnabled = true;

        }
        if let itm4_ttl = item4_basicInfo["title"] as? String{
            title_item4.text = itm4_ttl;
            title_item4!.addGestureRecognizer(title4);
            title_item4!.userInteractionEnabled = true;

        }
        
        /* =========== Display prices for item (5) ============ */
        
        if let itm0_prc = item0_basicInfo["convertedCurrentPrice"] as? String{
            var price_detail = "";
            var shippingServiceCost = "";
            var shippingType = "";
            
            if let shippingServiceCost_msg : AnyObject = item0_basicInfo["shippingServiceCost"]{
                shippingServiceCost = shippingServiceCost_msg as! String;
            }
            if let shippingType_msg : AnyObject = item0_shippingInfo["shippingType"]{
                shippingType = shippingType_msg as! String;
            }
            
            if(shippingServiceCost == "0.0" || shippingType == "Free" || shippingServiceCost == ""){
                price_detail = "(FREE Shipping)";
            }else{
                price_detail = "(+ $\(shippingServiceCost) Shipping)";
            }
            
            price_item0.text = "Price: $\(itm0_prc) \(price_detail)";
            
        }
        
        if let itm1_prc = item1_basicInfo["convertedCurrentPrice"] as? String{
            var price_detail = "";
            var shippingServiceCost = "";
            var shippingType = "";
            
            if let shippingServiceCost_msg : AnyObject = item1_basicInfo["shippingServiceCost"]{
                shippingServiceCost = shippingServiceCost_msg as! String;
            }
            if let shippingType_msg : AnyObject = item1_shippingInfo["shippingType"]{
                shippingType = shippingType_msg as! String;
            }
            
            if(shippingServiceCost == "0.0" || shippingType == "Free" || shippingServiceCost == ""){
                price_detail = "(FREE Shipping)";
            }else{
                price_detail = "(+ $\(shippingServiceCost) Shipping)";
            }
            
            price_item1.text = "Price: $\(itm1_prc) \(price_detail)";
        }
        
        if let itm2_prc = item2_basicInfo["convertedCurrentPrice"] as? String{
            var price_detail = "";
            var shippingServiceCost = "";
            var shippingType = "";
            
            if let shippingServiceCost_msg : AnyObject = item2_basicInfo["shippingServiceCost"]{
                shippingServiceCost = shippingServiceCost_msg as! String;
            }
            if let shippingType_msg : AnyObject = item2_shippingInfo["shippingType"]{
                shippingType = shippingType_msg as! String;
            }
            
            if(shippingServiceCost == "0.0" || shippingType == "Free" || shippingServiceCost == ""){
                price_detail = "(FREE Shipping)";
            }else{
                price_detail = "(+ $\(shippingServiceCost) Shipping)";
            }
            
            price_item2.text = "Price: $\(itm2_prc) \(price_detail)";
        }
        
        if let itm3_prc = item3_basicInfo["convertedCurrentPrice"] as? String{
            var price_detail = "";
            var shippingServiceCost = "";
            var shippingType = "";
            
            if let shippingServiceCost_msg : AnyObject = item3_basicInfo["shippingServiceCost"]{
                shippingServiceCost = shippingServiceCost_msg as! String;
            }
            if let shippingType_msg : AnyObject = item3_shippingInfo["shippingType"]{
                shippingType = shippingType_msg as! String;
            }
            
            if(shippingServiceCost == "0.0" || shippingType == "Free" || shippingServiceCost == ""){
                price_detail = "(FREE Shipping)";
            }else{
                price_detail = "(+ $\(shippingServiceCost) Shipping)";
            }
            
            price_item3.text = "Price: $\(itm3_prc) \(price_detail)";
        }
        
        if let itm4_prc = item4_basicInfo["convertedCurrentPrice"] as? String{
            var price_detail = "";
            var shippingServiceCost = "";
            var shippingType = "";
            
            if let shippingServiceCost_msg : AnyObject = item4_basicInfo["shippingServiceCost"]{
                shippingServiceCost = shippingServiceCost_msg as! String;
            }
            if let shippingType_msg : AnyObject = item4_shippingInfo["shippingType"]{
                shippingType = shippingType_msg as! String;
            }
            
            if(shippingServiceCost == "0.0" || shippingType == "Free" || shippingServiceCost == ""){
                price_detail = "(FREE Shipping)";
            }else{
                price_detail = "(+ $\(shippingServiceCost) Shipping)";
            }
            
            price_item4.text = "Price: $\(itm4_prc) \(price_detail)";
        }
        
        
        
        
        /* =========== Display images for items (5) =========== */
        
        let tapGesture0 = UITapGestureRecognizer(target: self, action: "tapGesture0:");
        let tapGesture1 = UITapGestureRecognizer(target: self, action: "tapGesture1:");
        let tapGesture2 = UITapGestureRecognizer(target: self, action: "tapGesture2:");
        let tapGesture3 = UITapGestureRecognizer(target: self, action: "tapGesture3:");
        let tapGesture4 = UITapGestureRecognizer(target: self, action: "tapGesture4:");
        
        if let img0_url = NSURL(string: item0_basicInfo["galleryURL"] as! String){
            if let img0_data = NSData(contentsOfURL: img0_url){
                url_images[0] = item0_basicInfo["viewItemURL"] as! String;
                img_item0!.image = UIImage(data: img0_data);
                img_item0!.addGestureRecognizer(tapGesture0);
                img_item0!.userInteractionEnabled = true;
            }
        }
        
        if let img1_url = NSURL(string: item1_basicInfo["galleryURL"] as! String){
            if let img1_data = NSData(contentsOfURL: img1_url){
                url_images[1] = item1_basicInfo["viewItemURL"] as! String;
                img_item1!.image = UIImage(data: img1_data);
                img_item1!.addGestureRecognizer(tapGesture1);
                img_item1!.userInteractionEnabled = true;
            }
        }
        
        if let img2_url = NSURL(string: item2_basicInfo["galleryURL"] as! String){
            if let img2_data = NSData(contentsOfURL: img2_url){
                url_images[2] = item2_basicInfo["viewItemURL"] as! String;
                img_item2!.image = UIImage(data: img2_data);
                img_item2!.addGestureRecognizer(tapGesture2);
                img_item2!.userInteractionEnabled = true;
            }
        }
        
        if let img3_url = NSURL(string: item3_basicInfo["galleryURL"] as! String){
            if let img3_data = NSData(contentsOfURL: img3_url){
                url_images[3] = item3_basicInfo["viewItemURL"] as! String;
                img_item3!.image = UIImage(data: img3_data);
                img_item3!.addGestureRecognizer(tapGesture3);
                img_item3!.userInteractionEnabled = true;
            }
        }
        
        if let img4_url = NSURL(string: item4_basicInfo["galleryURL"] as! String){
            if let img4_data = NSData(contentsOfURL: img4_url){
                url_images[4] = item4_basicInfo["viewItemURL"] as! String;
                img_item4!.image = UIImage(data: img4_data);
                img_item4!.addGestureRecognizer(tapGesture4);
                img_item4!.userInteractionEnabled = true;
            }
        }

        
    }
    
    func tapGesture0(gesture: UIGestureRecognizer){
        imageTapGesture(url_images[0]);
    }
    func tapGesture1(gesture: UIGestureRecognizer){
        imageTapGesture(url_images[1]);
    }
    func tapGesture2(gesture: UIGestureRecognizer){
        imageTapGesture(url_images[2]);
    }
    func tapGesture3(gesture: UIGestureRecognizer){
        imageTapGesture(url_images[3]);
    }
    func tapGesture4(gesture: UIGestureRecognizer){
        imageTapGesture(url_images[4]);
    }
    
    func imageTapGesture(url: String){
        UIApplication.sharedApplication().openURL(NSURL(string: url)!)
    }
    
    func titleTab0(gesture: UIGestureRecognizer){
        toDetail(bridge[0], sellerInfo: bridge[1], shippingInfo: bridge[2]);
    }
    
    func titleTab1(gesture: UIGestureRecognizer){
        toDetail(bridge[3], sellerInfo: bridge[4], shippingInfo: bridge[5]);
    }
    
    func titleTab2(gesture: UIGestureRecognizer){
        toDetail(bridge[6], sellerInfo: bridge[7], shippingInfo: bridge[8]);
    }
    
    func titleTab3(gesture: UIGestureRecognizer){
        toDetail(bridge[9], sellerInfo: bridge[10], shippingInfo: bridge[11]);
    }
    
    func titleTab4(gesture: UIGestureRecognizer){
        toDetail(bridge[12], sellerInfo: bridge[13], shippingInfo: bridge[14]);
    }
    
    func toDetail(basicInfo: NSDictionary, sellerInfo: NSDictionary, shippingInfo: NSDictionary){
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        var vc: DetailList = storyboard.instantiateViewControllerWithIdentifier("DetailList") as! DetailList;
        
        vc.item_basicInfo = basicInfo;
        vc.item_sellerInfo = sellerInfo;
        vc.item_shippingInfo = shippingInfo;
        
        self.presentViewController(vc, animated: true, completion: nil)

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
