//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by Yu Wati Nyi on 12/3/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var morePetsStepper: UIStepper!
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var schoolName: UITextField!
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var numberPets: UILabel!
    
    @IBOutlet weak var introduceSelf: UIButton!
    
    @IBAction func stepperDidChange(_ sender: UIStepper){
        numberPets.text = "\(Int(sender.value))"
    }
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton){
        
        
        
        //lets us choose the title we have selected from the segmented control
        //In our example that is whether it is first, second, third, or fourth
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        
        //Creating a constant of type string that holds an introduction. The Introduction recieves the values from the outlet connections
        let introduction = "My name is \(firstName.text!) \(lastName.text!) and I attend \(schoolName.text!). I am currently in my \(year!) year and I own \(numberPets.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets."
        
        //Creates the alert where we pass in our message, which our introduction
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        //a way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        //Passing this action to the alert controller so it can be dismissed
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func saveInformation(_ sender: Any){
        //Get information from text fields
        guard
            let firstName = firstName.text, !firstName.isEmpty,
            let lastName = lastName.text, !lastName.isEmpty,
            let school = schoolName.text, !school.isEmpty
        else{
            //handle the case where any of the text fields is empty
            return
        }
        
        //save information to UserDefaults
        UserDefaults.standard.set(firstName, forKey: "userFirstName")
        UserDefaults.standard.set(lastName, forKey: "userLastName")
        UserDefaults.standard.set(school, forKey: "userSchool")
        
        //synchronize UserDefaults to make sure changes are saved immediately
        UserDefaults.standard.synchronize()
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        introduceSelf.backgroundColor = UIColor(red: 144/255.0, green: 212/255.0, blue: 95/255.0, alpha: 1.0)
        introduceSelf.layer.cornerRadius = 10
        introduceSelf.layer.masksToBounds = true
        introduceSelf.setTitle("Introduce Self", for: .normal)
        introduceSelf.setTitleColor(.white, for: .normal)
        
        //Retrieve the stored information if any
        if let storedFirstName = UserDefaults.standard.string(forKey: "userFirstName"){
            firstName.text = storedFirstName
        }
        
        if let storedLastName = UserDefaults.standard.string(forKey: "userLastName"){
            lastName.text = storedLastName
        }
        
        if let storedSchool = UserDefaults.standard.string(forKey: "userSchool"){
            schoolName.text = storedSchool
        }
        
      
    }


}

