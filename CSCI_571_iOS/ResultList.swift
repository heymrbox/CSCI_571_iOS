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
    var url_images = Array(count: 5, repeatedValue: "");
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        parseJSON(response);
        
    }
    
    func parseJSON(response: NSDictionary){
        resultHeader.text = "Results for '" + resultKeyword + "'";
        
        let tapGesture0 = UITapGestureRecognizer(target: self, action: "tapGesture0:");
        let tapGesture1 = UITapGestureRecognizer(target: self, action: "tapGesture1:");
        let tapGesture2 = UITapGestureRecognizer(target: self, action: "tapGesture2:");
        let tapGesture3 = UITapGestureRecognizer(target: self, action: "tapGesture3:");
        let tapGesture4 = UITapGestureRecognizer(target: self, action: "tapGesture4:");
        
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
        println(url);
        UIApplication.sharedApplication().openURL(NSURL(string: url)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
