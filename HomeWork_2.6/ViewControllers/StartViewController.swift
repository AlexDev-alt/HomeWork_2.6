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
     var redSliderValue: Float!
     var greenSliderValue: Float!
     var blueSliderValue: Float!
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let colorSettingVC = segue.destination as! ViewController
        colorSettingVC.delegate = self
        
        colorSettingVC.colorValue = view.backgroundColor
        
        colorSettingVC.setupRedSliderValue = redSliderValue ?? 0.5
        colorSettingVC.setupGreenSliderValue = greenSliderValue ?? 0.5
        colorSettingVC.setupBlueSliderValue = blueSliderValue ?? 0.5
    }
 
}

//MARK: - ColorSettingDelegate
extension StartViewController: ColorSettingDelegate {
    
    func changeSliderValu( red: Float, green: Float, blue: Float) {
        redSliderValue = red
        greenSliderValue = green
        blueSliderValue = blue
    }
    
    func changeViewColor(_ colorValue: UIColor) {
        view.backgroundColor = colorValue
    }
  
}
