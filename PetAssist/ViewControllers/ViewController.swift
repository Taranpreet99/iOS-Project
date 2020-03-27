//
//  ViewController.swift
//  PetAssist
//  yu zhang *2
//  Created by Taranpreet Singh on 2020-03-10.
//  Copyright © 2020 Taranpreet Singh Yu Zhang. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet var uname : UITextField!
    @IBOutlet var pass : UITextField!
    var count = 0
    
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func unwindToHome(sender : UIStoryboardSegue){
        
    }
    
    @IBAction func login(sender: UIButton){
        
       
        for i in 0..<mainDelegate.people.count{
            
            if(mainDelegate.people[i].username == uname.text){
                
                if(mainDelegate.people[i].password == pass.text){
                    
                    count = 2
                    break
                   // self.performSegue(withIdentifier: "SegueToHomePage", sender: nil)
                }else{
                    
                    let alertController = UIAlertController(title: "Incorrect Password!", message: "Please enter correct password" , preferredStyle: .alert)
                    
                    let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    
                    alertController.addAction(cancel)
                    present(alertController,animated: true)
                    
                }
                
            }else{
                count = 1
            }
            
            
        }
        
        if(count == 2){
            self.performSegue(withIdentifier: "SegueToHomePage", sender: nil)
        }
        else{
                
                let alertController = UIAlertController(title: "Incorrect Username", message: "Username that you have entered does not exist. Either register or try again", preferredStyle: .alert)
                
                let cancel = UIAlertAction(title: "Try Again!", style: .cancel, handler: nil)
                
                let register = UIAlertAction(title: "Register", style: .default){
                    (UIAlertAction) in
                    
                    self.performSegue(withIdentifier: "SegueToRegister", sender: nil)
                }
                
                alertController.addAction(cancel)
                alertController.addAction(register)
                present(alertController,animated: true)
                
        }
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      mainDelegate.readDataFromDatabase()
        
        // Do any additional setup after loading the view.
    }


}

