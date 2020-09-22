//
//  FunSectionViewController.swift
//  PetAssist
//
//  Created by Taranpreet Singh on 2020-03-28.
//  Copyright © 2020 Taranpreet Singh. All rights reserved.
//  Developed by Taranpreet Singh

import UIKit
import AVFoundation

class FunSectionViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    //Connected to volume slider
     @IBOutlet var volSlider : UISlider!
    //Variable for sound player
    var soundPlayer : AVAudioPlayer?
    
    //Connected to Image view
    @IBOutlet var imageView : UIImageView!
    
    //Connected to spin button
    @IBOutlet var spinBtn : UIButton!
    
    //variable CA LAyer
     var layer : CALayer!
    //Var for UIImage
    var pickedImage : UIImage!

    //array to store sound names
    var sounds : [String] = ["Crying","Barking","Growling","Whimpering","Woof","Whining"]
    
    //array to store name of files
    var soundSourceName : [String] = ["crying","barking","growling","whimpering","woof","Whining"]
    
    //Connected to choose button
    @IBOutlet var chooseBuuton: UIButton!
    
    //Image picker variable
    var imagePicker = UIImagePickerController()
    
    //Function to be performed when chooseImage is pressed
    @IBAction func chooseImage() {
        
        //Source for image picker
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    //Image selection is completed
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        pickedImage = image
        dismiss(animated: true, completion: nil)
    }
    
    
    //Spin animation
    @IBAction func spinAnimation(sender: Any){
        
        //Initialize layer
        layer = .init()
        //Set contents of layer
        layer?.contents = pickedImage?.cgImage
        //Size
        layer?.bounds = CGRect(x:0 , y:0, width:374, height: 326)
        layer?.anchorPoint = CGPoint(x: 0, y: 0)
        //add layer
        imageView.layer.addSublayer(layer)
        
        
        
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue = 0.0
        fadeAnimation.isRemovedOnCompletion = false
        fadeAnimation.duration = 3.0
        fadeAnimation.beginTime = 1.0
        fadeAnimation.isAdditive = false
        fadeAnimation.fillMode = .both
        fadeAnimation.repeatCount = .infinity
        fadeAnimation.autoreverses = true
        layer?.add(fadeAnimation, forKey: nil)
    }
    
    
    //Number of rows in picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sounds.count
        
    }
    
    //number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Text to be displayed - know as title
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sounds[row]
        
    }
    
    //Function to be performed when an Item is selected in the picker view
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let soundURL = Bundle.main.path(forResource: soundSourceName[row], ofType: "mp3")
        let url = URL(fileURLWithPath: soundURL!)
        soundPlayer = try! AVAudioPlayer.init(contentsOf: url)
        soundPlayer?.currentTime = 0
        soundPlayer?.volume = volSlider.value
        soundPlayer?.play()
        
        }
    
    //update the value of volume when slided
    @IBAction func volume(sender: Any){
        
       soundPlayer?.volume = volSlider.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    

   

}
