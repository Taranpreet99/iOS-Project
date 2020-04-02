//
//  FunSectionViewController.swift
//  PetAssist
//
//  Created by Taranpreet Singh on 2020-03-28.
//  Copyright © 2020 Taranpreet Singh Yu Zhang. All rights reserved.
//

import UIKit
import AVFoundation

class FunSectionViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
     @IBOutlet var volSlider : UISlider!
    var soundPlayer : AVAudioPlayer?
    
    @IBOutlet var imageView : UIImageView!
    
    @IBOutlet var spinBtn : UIButton!
     var layer : CALayer!
    var pickedImage : UIImage!

    var sounds : [String] = ["Crying","Barking","Growling","Whimpering","Woof","Whining"]
    
    var soundSourceName : [String] = ["crying","barking","growling","whimpering","woof","Whining"]
    
  
    @IBOutlet var chooseBuuton: UIButton!
    var imagePicker = UIImagePickerController()
    
    @IBAction func chooseImage() {
        
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        pickedImage = image
        dismiss(animated: true, completion: nil)
    }
  
    @IBAction func spinAnimation(sender: Any){
        
        layer = .init()
        layer?.contents = pickedImage?.cgImage
        layer?.bounds = CGRect(x:0 , y:0, width:374, height: 326)
        layer?.anchorPoint = CGPoint(x: 0, y: 0)
        imageView.layer.addSublayer(layer)
        
        //rotateAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
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
        
        let soundURL = Bundle.main.path(forResource: soundSourceName[row], ofType: "mp3")
        let url = URL(fileURLWithPath: soundURL!)
        soundPlayer = try! AVAudioPlayer.init(contentsOf: url)
        soundPlayer?.currentTime = 0
        soundPlayer?.volume = volSlider.value
        soundPlayer?.play()
        
        }
    
    @IBAction func volume(sender: Any){
        
       soundPlayer?.volume = volSlider.value
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
