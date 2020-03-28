//
//  RegisterViewController.swift
//  PetAssist
//
//  Created by Taranpreet Singh on 2020-03-27.
//  Copyright © 2020 Taranpreet Singh Yu Zhang. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var tfName : UITextField!
    @IBOutlet var tfEmail : UITextField!
    @IBOutlet var tfUsername : UITextField!
    @IBOutlet var tfNewPassword : UITextField!
    @IBOutlet var tfConfirmPassword : UITextField!
    
    @IBAction func addPerson(sender : Any){
        
        if(tfName.text == "" || tfEmail.text == "" || tfUsername.text == "" || tfNewPassword.text == "" || tfConfirmPassword.text == ""){
            
            let alertController = UIAlertController(title: "Missing fields", message: "Please make sure you are not missing any fields." , preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            
            alertController.addAction(cancel)
            present(alertController,animated: true)
            
        }else{
        
        var password : String!
        if(tfNewPassword.text == tfConfirmPassword.text){
            
            password = tfConfirmPassword.text
            
            let person : Data = Data.init()
            person.initWithData(theRow: 0, theName: tfName.text!, theEmail: tfEmail.text!, theUsername: tfUsername.text!, thePassword: password)
            
            let mainDelegate = UIApplication.shared.delegate as! AppDelegate
            
           let returnCode = mainDelegate.insertIntoDatabase(person: person)
            
            var returnMsg : String = "Registered Successfully"
            
          if returnCode == false {
                returnMsg = "Register failed"
 
            }
            
            let alertController = UIAlertController(title: "Register", message: returnMsg, preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            let login = UIAlertAction(title: "Login", style: .default){
                (UIAlertAction) in
                
                self.performSegue(withIdentifier: "SegueToLogin", sender: nil)
            }
            
            alertController.addAction(login)
            alertController.addAction(cancel)
            present(alertController,animated: true)
        }else{
            let alertController = UIAlertController(title: "Password Does not match", message: "Please make sure you enter same password in both fields", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            
            alertController.addAction(cancel)
            present(alertController,animated: true)
            
         }
        
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return textField.resignFirstResponder()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


