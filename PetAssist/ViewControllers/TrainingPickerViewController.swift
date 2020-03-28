//
//  TrainingPickerViewController.swift
//  PetAssist
//
//  Created by Taranpreet Singh on 2020-03-28.
//  Copyright © 2020 Taranpreet Singh Yu Zhang. All rights reserved.
//

import UIKit

class TrainingPickerViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBAction func unwindToPickerView(sender: UIStoryboardSegue){
        
    }
    
    var trainingLinks: [String] = ["https://www.youtube.com/results?search_query=pet+Behavioral+training","https://www.youtube.com/results?search_query=pet+Obedience+training", "https://www.youtube.com/results?search_query=pets+Agility+training", "https://www.youtube.com/results?search_query=Vocational+training+for+pets" ]
   
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mainDelegate.trainingOptions.count
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mainDelegate.trainingOptions[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let alertController = UIAlertController(title: mainDelegate.trainingOptions[row] , message: "You have selected" + mainDelegate.trainingOptions[row] + ". Do you want to continue?", preferredStyle: .alert)
        
        let no = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        let yes = UIAlertAction(title: "Yes", style: .default){
            (UIAlertAction) in
            
            self.mainDelegate.selectedURL = self.trainingLinks[row]
            self.performSegue(withIdentifier: "SegueToTutorialsWeb", sender: nil)
        }
        
        alertController.addAction(no)
        alertController.addAction(yes)
        present(alertController, animated: true)
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
