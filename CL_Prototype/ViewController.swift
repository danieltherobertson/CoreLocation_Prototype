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
    var activeQuestion: Question!
    var questionIndex = 0
    
    var question1:Question!
    var question2:Question!
    var question3:Question!

    var name:String!
    var gender:String!
    var homeLocation:CLLocation?
    
    var input:UITextField!
    var output:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Creates questions
        question1 = Question(title: "What's your name?", acceptedAnswers:[""])
        question2 = Question(title: "Hello, \(name), what's your gender?", acceptedAnswers: ["Male","Female","Boy","Girl"])
        question3 = Question(title: "Is your current location your home?", acceptedAnswers: ["Yes","No"])
        
        //Adds questions to questions array
        questions += [question1,question2,question3]
        
        
        //Sets default active question to Q1
        activeQuestion = questions[0]
        
        
        //Draw content+layout
        output = UILabel(frame:CGRectMake(30, 250, screenWidth-60, 100))
        output.text = activeQuestion.title
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
        locationManager.distanceFilter = 100.0 //Location will only update if they move more than 100 metres
        locationManager.startUpdatingLocation()
        
        view.backgroundColor = UIColor.lightGrayColor()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {

        if activeQuestion == questions[0] { //If activeQuestion is Q1
            if input.text != "" { //If the user types something as their name
                name = input.text //Saves the name to var: name
                question2.title = "Hello, \(name). Gender scan failed, please manually input your gender." //Changes Q2.title to include var: name
                input.text = nil //Clears input.text, setting up for Q2
                activeQuestion = questions[1] //Moves the activeQuestion on to Q2
                output.text = activeQuestion.title //Changes output.text to display Q2.title
            } else { //Else if the user types nothing
                let ac = UIAlertController(title: "System Error: 3230_ac334", message: "My scans detect no user input", preferredStyle: .Alert)
                ac.addAction(UIAlertAction(title: "Reset Question", style: .Default, handler: nil))
                presentViewController(ac, animated: true, completion: nil)
                input.text = nil //Clears text field
            }
            return true
            
        } else if activeQuestion == questions[1] { //Or if activeQuestion is Q2
            if let index = question2.acceptedAnswers.indexOf(input.text!) { //Checks if input.text = any accepted answer of Q2
                gender = question2.acceptedAnswers[index] //Saves the selected gender to var: gender
                question3.title = "Gender: '\(gender)' saved. Is your current location your home?"
                input.text = nil
                activeQuestion = questions[2]
                output.text = activeQuestion.title
                
                print(name,", ", gender)
            } else { //If input.text doesn't = any accepted answer of Q2
                let ac = UIAlertController(title: "I'm sorry, I don't understand that.", message: "Accepted answers: Male, Female, Boy, Girl", preferredStyle: .Alert)
                ac.addAction(UIAlertAction(title: "Reset Question", style: .Default, handler: nil))
                presentViewController(ac, animated: true, completion: nil)
                input.text = nil //Clears text field
            }
            return true
            
        } else if activeQuestion == questions[2] {
            if input.text == question3.acceptedAnswers[0] {
                homeLocation = locationManager.location
                
                let ac = UIAlertController(title: "Home Location", message: "Home location set to \(homeLocation)", preferredStyle: .Alert)
                ac.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
                presentViewController(ac, animated: true, completion: nil)

                
            } else if input.text == question3.acceptedAnswers[1] {
                
            }
    
            
        }
         return true
    }
 
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last
        
        if let newLocation = newLocation {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

