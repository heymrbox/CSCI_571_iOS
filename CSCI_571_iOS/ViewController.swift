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
    
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
    let sortByOptions = ["Best Match", "Price: highest first", "Price + Shipping: highest first", "Price + Shipping: lowest first"];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        sortBy.delegate = self;
        sortBy.dataSource = self;
        
        initialization();
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initialization(){
        sortByText.text = sortByOptions[0];
        sortByText.inputView = sortBy;
        errorLabel.text = "";
        errorLabel.textColor = UIColor.redColor();
        errorLabel.numberOfLines = 5;
        
//        keywordText.addTarget(self, action: "keywordDidChange:", forControlEvents: UIControlEvents.EditingChanged);
//        priceFromText.addTarget(self, action: "minPriceDidChange:", forControlEvents: UIControlEvents.EditingChanged);
//        priceToText.addTarget(self, action: "maxPriceDidChange:", forControlEvents: UIControlEvents.EditingChanged);
        clearButton.addTarget(self, action: "clearForm", forControlEvents: UIControlEvents.TouchUpInside);
        submitButton.addTarget(self, action: "validation", forControlEvents: UIControlEvents.TouchUpInside);
    }
    
//    func keywordDidChange(textField: UITextField) {
//        if(keywordText.text == ""){
//            errorLabel.text = "Please enter a keyword";
//        }else{
//            errorLabel.text = "";
//        }
//        
//    }
    
//    func minPriceDidChange(textField: UITextField) {
//        NSLog("min");
//    }
//    
//    func maxPriceDidChange(textField: UITextField) {
//        NSLog("max");
//    }
    
    func clearForm(){
        keywordText.text = "";
        priceFromText.text = "";
        priceToText.text = "";
        sortByText.text = sortByOptions[0];
        errorLabel.text = "";
    }
    
    func validation(){
        let emptyKeyword = "Please enter a keyword\n";
        let notNumber = "Price should be valid decimal number\n";
        let notInteger = "Price should be positive integer\n";
        let notBiggerThan = "Max price should be bigger than Min price\n";
        let other = "No Results Found\n";
        
        var error = "";
        var minPrice = (priceFromText.text as NSString).floatValue;
        var maxPrice = (priceToText.text as NSString).floatValue;
        
        println(minPrice);
        
        if(keywordText.text == ""){
            error += emptyKeyword;
        }
        
        if(priceToText.text == ""){
            maxPrice = 2147483647.0;
        }
        
        println(maxPrice);
        
        if(minPrice != 0.0 && maxPrice != 0.0){
            
            if(minPrice < 0 || maxPrice < 0){
                error += notInteger;
            }
            if(minPrice > maxPrice){
                error += notBiggerThan;
            }
        }else if(priceFromText.text != "" || priceToText.text != ""){
            
            error += notNumber;
        }
      
        
        errorLabel.text = error;

    }
    
    
    /* ---  Handle sortBy options --- */
    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }


}

