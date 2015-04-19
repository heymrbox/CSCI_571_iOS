//
//  ViewController.swift
//  CSCI_571_iOS
//
//  Created by Weiwei Zheng on 4/17/15.
//  Copyright (c) 2015 Weiwei. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var keywordText: UITextField!
    @IBOutlet var priceFromText: UITextField!
    @IBOutlet var priceToText: UITextField!
    @IBOutlet var sortByText: UITextField!
    @IBOutlet var sortBy: UIPickerView! = UIPickerView()
    
    
    let sortByOptions = ["Best Match", "Price: highest first", "Price + Shipping: highest first", "Price + Shipping: lowest first"];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        sortBy.delegate = self;
        sortBy.dataSource = self;
        
        sortByText.text = sortByOptions[0];
        self.sortByText.inputView = sortBy;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sortByOptions.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return sortByOptions[row];
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sortByText.text = "\(sortByOptions[row])";
    }
    
    func textFieldShouldBeginEditing(sortByText: UITextField) -> Bool {
        sortBy.hidden = false
        return false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }


}

