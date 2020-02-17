//
//  Protocols.swift
//  HomeWork_2.6
//
//  Created by Macbook on 16.02.2020.
//  Copyright © 2020 Alex Dev. All rights reserved.
//

import UIKit

protocol ColorSettingProtocol {
    
    var colorSetting: UIColor { get }
    
    var redSliderValue: Float { get }
    var greenSliderValue: Float { get }
    var blueSliderValue: Float { get }
}

protocol ColorSettingDelegate {
    
    func changeViewColor(to colorValue: UIColor)
    func changeSliderValu( red: Float, green: Float, blue: Float)
}


