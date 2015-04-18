//
//  ViewController.swift
//  CSCI_571_iOS
//
//  Created by Weiwei Zheng on 4/17/15.
//  Copyright (c) 2015 Weiwei. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet var keywordText: UITextField!
    @IBOutlet var priceFromText: UITextField!
    @IBOutlet var priceToText: UITextField!
    @IBOutlet var sortBy: UIPickerView! = UIPickerView()
    
    @IBOutlet var sortByText: UITextField!
    
    
    var sortByOptions = ["5", "10"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sortBy.hidden = true;
        
        sortByText.text = sortByOptions[0];
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

