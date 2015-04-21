//
//  ResultList.swift
//  CSCI_571_iOS
//
//  Created by Weiwei Zheng on 4/20/15.
//  Copyright (c) 2015 Weiwei. All rights reserved.
//

import UIKit


class ResultList: UIViewController {

    
    @IBOutlet var testLabel: UILabel!
    
    var response = NSDictionary();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        println("response= \(response)");
        testLabel.text = "fff";
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
