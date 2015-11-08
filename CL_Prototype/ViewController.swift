//
//  ViewController.swift
//  CL_Prototype
//
//  Created by Daniel Robertson on 08/11/2015.
//  Copyright © 2015 Daniel Robertson. All rights reserved.
//

import UIKit; import CoreLocation

class ViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var words = ["spook", "doot", "calcium", "bones", "thank", "updoot"]
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height
    var questions = [Question]()

    var name:String!
    
    var input:UITextField!
    var output:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question1 = Question(title: "What's your name?")
        let question2 = Question(title: "What's your gender?")
        
        questions += [question1,question2]
        
        output = UILabel(frame:CGRectMake(30, 250, screenWidth-60, 100))
        output.text = questions[0].title
        output.font = UIFont(name: "Avenir-Heavy", size: 16)
        output.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        output.textAlignment = NSTextAlignment.Center
        output.numberOfLines = 0
        self.view.addSubview(output)

        input = UITextField(frame: CGRectMake(30, 410, screenWidth-60, 60))
        input.placeholder = "Type shit here"
        input.font = UIFont(name: "Avenir-Heavy", size: 16)
        input.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        input.textAlignment = NSTextAlignment.Center
        input.autocapitalizationType = UITextAutocapitalizationType.Sentences
        input.delegate = self
        
        self.view.addSubview(input)
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.distanceFilter = 100.0
        locationManager.startUpdatingLocation()
        
        view.backgroundColor = UIColor.lightGrayColor()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if input.text != "" {
            output.text = questions[1].title
            name = input.text
        } else {
            let ac = UIAlertController(title: "No Name Entered", message: "You haven't entered anything, try again retard!", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
        }
        return true
    }
    
    
    
    
    
    
    
   
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last
        
        if let newLocation = newLocation {
            let randomIndex = Int(arc4random_uniform(UInt32(words.count)))

            
    
        }
       

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

