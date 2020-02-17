//
//  StartViewController.swift
//  HomeWork_2.6
//
//  Created by Macbook on 16.02.2020.
//  Copyright © 2020 Alex Dev. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    //MARK: - Public properties
   private var redSliderValue = Float.random(in: 0.0..<1.0)
   private var greenSliderValue = Float.random(in: 0.0..<1.0)
   private var blueSliderValue = Float.random(in: 0.0..<1.0)
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let colorSettingVC = segue.destination as! ViewController
        colorSettingVC.delegate = self
        
        colorSettingVC.colorValue = view.backgroundColor
        
        colorSettingVC.setupRedSliderValue = redSliderValue
        colorSettingVC.setupGreenSliderValue = greenSliderValue
        colorSettingVC.setupBlueSliderValue = blueSliderValue
    }
 
}

//MARK: - ColorSettingDelegate
extension StartViewController: ColorSettingDelegate {
    
    func changeSliderValu( red: Float, green: Float, blue: Float) {
        redSliderValue = red
        greenSliderValue = green
        blueSliderValue = blue
    }
    
    func changeViewColor(to colorValue: UIColor) {
        view.backgroundColor = colorValue
    }
  
}
