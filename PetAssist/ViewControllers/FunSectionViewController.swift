//
//  FunSectionViewController.swift
//  PetAssist
//
//  Created by Taranpreet Singh on 2020-03-28.
//  Copyright © 2020 Taranpreet Singh Yu Zhang. All rights reserved.
//

import UIKit
import AVFoundation

class FunSectionViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource  {
    
     @IBOutlet var volSlider : UISlider!
    var soundPlayer : AVAudioPlayer?

    var sounds : [String] = ["Crying","Barking","Growling","Whimpering","Woof","Whining"]
    
    var soundSource : [String] = ["crying.mp3","barking.mp3","growling.mp3","whimpering.mp3","woof.wav","Whining.wav"]
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sounds.count
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sounds[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let soundURL = soundSource[row]
        let url = URL(fileURLWithPath: soundURL)
        soundPlayer = try! AVAudioPlayer.init(contentsOf: url)
        soundPlayer?.currentTime = 0
        soundPlayer?.volume = volSlider.value
        soundPlayer?.play()
        
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
