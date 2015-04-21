//
//  ViewController.swift
//  CSCI_571_iOS
//
//  Created by Weiwei Zheng on 4/17/15.
//  Copyright (c) 2015 Weiwei. All rights reserved.
//

import UIKit

class ViewController : UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var keywordText: UITextField!
    @IBOutlet var priceFromText: UITextField!
    @IBOutlet var priceToText: UITextField!
    @IBOutlet var sortByText: UITextField!
    @IBOutlet var sortBy: UIPickerView! = UIPickerView()
    
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
    let sortByOptions = ["Best Match", "Price: highest first", "Price + Shipping: highest first", "Price + Shipping: lowest first"];
    
    var result = NSDictionary();
    
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
        
        clearButton.addTarget(self, action: "clearForm", forControlEvents: UIControlEvents.TouchUpInside);
        submitButton.addTarget(self, action: "validation", forControlEvents: UIControlEvents.TouchUpInside);
    }

    
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
        var nFlag = false;
        var pFlag = false;
        var flag = true;
        
        
        if(keywordText.text == ""){
            error += emptyKeyword;
            flag = false;
        }
        
        if(priceFromText.text == "0" || priceFromText.text == "0.0" || priceFromText.text == "0.00"){
            minPrice = 0.000000000001;
        }
        if(priceToText.text == "0" || priceToText.text == "0.0" || priceToText.text == "0.00"){
            maxPrice = 0.000000000001;
        }
        
        if(priceFromText.text != ""){
            if(minPrice == 0.0 && !nFlag){
                error += notNumber;
                nFlag = true;
                flag = false;
            }
            if(minPrice < 0 && !pFlag){
                error += notInteger;
                pFlag = true;
                flag = false;
            }
        }
        
        if(priceToText.text != ""){
            if(maxPrice == 0.0 && !nFlag){
                error += notNumber;
                nFlag = true;
                flag = false;
            }
            if(maxPrice < 0 && !pFlag){
                error += notInteger;
                pFlag = true;
                flag = false;
            }
        }
        
        if(priceFromText.text != "" && priceToText.text != ""){
            if(minPrice != 0.0 && maxPrice != 0.0){
                if(minPrice > maxPrice){
                    error += notBiggerThan;
                    flag = false;
                }
            }
        }
        if(flag){
            sendRequestToServer();
        }
        
        errorLabel.text = error;

    }
    
    func sendRequestToServer() -> NSDictionary{
        println("Request sending");
        
        var additional = "?keywords=iphone+6&lowestPrice=&highestPrice=&shipping_time=&sortBy=BestMatch&resultsPerPage=5&inputPageNum=1";
        var urlToGo = "http://csci571-weiwei-env.elasticbeanstalk.com/ebay_search.php" + additional;
        
        var url: NSURL = NSURL(string: urlToGo)!;
        var request: NSMutableURLRequest = NSMutableURLRequest(URL: url);
        let urlSession = NSURLSession.sharedSession();
        
        let jsonQuery = urlSession.dataTaskWithURL(url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                println(error.localizedDescription)
            }
            var err: NSError?
            
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary;
            if (err != nil) {
                println("JSON Error \(err!.localizedDescription)")
            }
            
            //println(jsonResult);
            self.result = jsonResult;
            
            dispatch_async(dispatch_get_main_queue()) {
                var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                var vc: ResultList = storyboard.instantiateViewControllerWithIdentifier("ResultList") as! ResultList;
                vc.response = jsonResult;
                self.presentViewController(vc, animated: true, completion: nil)
            }

            
        })
        jsonQuery.resume();

        return self.result;
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
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        var re : ResultList = segue.destinationViewController as! ResultList;
//        re.response = temp;
//        re.test = keywordText.text;
//    }

}





