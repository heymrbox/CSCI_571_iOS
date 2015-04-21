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
    
    
    @IBOutlet var backButton: UIButton!
    
    
    var response = NSDictionary();
    var resultKeyword = "";
    
    var imgArr = [UIImageView?](count: 5, repeatedValue: nil);
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        imgArr[0] = img_item0;
        imgArr[1] = img_item1;
        imgArr[2] = img_item2;
        imgArr[3] = img_item3;
        imgArr[4] = img_item4;
        
        parseJSON(response);
        
        // Do any additional setup after loading the view.
    }
    
    func parseJSON(response: NSDictionary){
//        println(response);
        resultHeader.text = "Results for '" + resultKeyword + "'";
        
        var item0: AnyObject;
        var item1: AnyObject;
        var item2: AnyObject;
        var item3: AnyObject;
        var item4: AnyObject;

        item0 = response["item0"]! as! NSDictionary;
        item1 = response["item1"]! as! NSDictionary;
        item2 = response["item2"]! as! NSDictionary;
        item3 = response["item3"]! as! NSDictionary;
        item4 = response["item4"]! as! NSDictionary;

        
        var item0_basicInfo: AnyObject;
        var item1_basicInfo: AnyObject;
        var item2_basicInfo: AnyObject;
        var item3_basicInfo: AnyObject;
        var item4_basicInfo: AnyObject;
        
        item0_basicInfo = item0["basicInfo"]! as! NSDictionary;
        item1_basicInfo = item1["basicInfo"]! as! NSDictionary;
        item2_basicInfo = item2["basicInfo"]! as! NSDictionary;
        item3_basicInfo = item3["basicInfo"]! as! NSDictionary;
        item4_basicInfo = item4["basicInfo"]! as! NSDictionary;

        
        var item0_sellerInfo: AnyObject;
        var item1_sellerInfo: AnyObject;
        var item2_sellerInfo: AnyObject;
        var item3_sellerInfo: AnyObject;
        var item4_sellerInfo: AnyObject;
    
        item0_sellerInfo = item0["sellerInfo"]! as! NSDictionary;
        item1_sellerInfo = item1["sellerInfo"]! as! NSDictionary;
        item2_sellerInfo = item2["sellerInfo"]! as! NSDictionary;
        item3_sellerInfo = item3["sellerInfo"]! as! NSDictionary;
        item4_sellerInfo = item4["sellerInfo"]! as! NSDictionary;


        var item0_shippingInfo: AnyObject;
        var item1_shippingInfo: AnyObject;
        var item2_shippingInfo: AnyObject;
        var item3_shippingInfo: AnyObject;
        var item4_shippingInfo: AnyObject;

        item0_shippingInfo = item0["shippingInfo"]! as! NSDictionary;
        item1_shippingInfo = item1["shippingInfo"]! as! NSDictionary;
        item2_shippingInfo = item2["shippingInfo"]! as! NSDictionary;
        item3_shippingInfo = item3["shippingInfo"]! as! NSDictionary;
        item4_shippingInfo = item4["shippingInfo"]! as! NSDictionary;
        
        let img0_url = NSURL(string: item0_basicInfo["galleryURL"] as! String);
        let img0_data = NSData(contentsOfURL: img0_url!);
        imgArr[0]!.image = UIImage(data: img0_data!);
        
        let img1_url = NSURL(string: item1_basicInfo["galleryURL"] as! String);
        let img1_data = NSData(contentsOfURL: img1_url!);
        imgArr[1]!.image = UIImage(data: img1_data!)
        
        let img2_url = NSURL(string: item2_basicInfo["galleryURL"] as! String);
        let img2_data = NSData(contentsOfURL: img2_url!);
        imgArr[2]!.image = UIImage(data: img2_data!)
        
        let img3_url = NSURL(string: item3_basicInfo["galleryURL"] as! String);
        let img3_data = NSData(contentsOfURL: img3_url!);
        imgArr[3]!.image = UIImage(data: img3_data!)
        
        let img4_url = NSURL(string: item4_basicInfo["galleryURL"] as! String);
        let img4_data = NSData(contentsOfURL: img4_url!);
        imgArr[4]!.image = UIImage(data: img4_data!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
