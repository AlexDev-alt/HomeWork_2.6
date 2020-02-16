//
//  ViewController.swift
//  HomeWork_2.6
//
//  Created by Macbook on 13.02.2020.
//  Copyright © 2020 Alex Dev. All rights reserved.
//

import UIKit


class ViewController: UIViewController, ColorSettingProtocol {
    
    //MARK: - Public properties
    var colorValue: UIColor!
    
    var setupRedSliderValue: Float!
    var setupGreenSliderValue: Float!
    var setupBlueSliderValue: Float!
    
    let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
    
    //Delegate properties
    var delegate: ColorSettingDelegate!
    
    var colorSetting: UIColor {
        UIColor (
            red:CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    var redSliderValue: Float { redSlider.value }
    var greenSliderValue: Float { greenSlider.value }
    var blueSliderValue: Float { blueSlider.value }
    
    //MARK: - IBOutlets
    @IBOutlet var sunImageView: UIImageView!
    @IBOutlet var secondSunImageView: UIImageView!
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var buttonLabel: UIButton!
    
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        
        setSliderStartValue()
        setValueLabels()
        setValueTextFields()
        
        addDoneButtonTo(redTextField)
        addDoneButtonTo(greenTextField)
        addDoneButtonTo(blueTextField)
        
        setupImageView()
        setupImageViewEndAnimator()
    }
    
    
    //MARK: - Private Methods
    //Image View settings
    private func setupImageView() {
        self.sunImageView.transform = CGAffineTransform(rotationAngle: -1)
        self.secondSunImageView.transform = CGAffineTransform(rotationAngle: 1)
    }
    
    private func setupImageViewEndAnimator() {
        animator.addAnimations {
            self.sunImageView.transform = CGAffineTransform(rotationAngle: 1)
            self.secondSunImageView.transform = CGAffineTransform(rotationAngle: -1)
        }
    }
    
    private func changeColorViewAndButton() {
        sunImageView.tintColor = UIColor(
            red:CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
        
        secondSunImageView.tintColor = UIColor(
            red:CGFloat(blueSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(redSlider.value),
            alpha: 1)
        
        buttonLabel.titleLabel?.textColor = UIColor (
        red:CGFloat(greenSlider.value),
        green: CGFloat(blueSlider.value),
        blue: CGFloat(redSlider.value),
        alpha: 1)
        
    }
    
    
    private func setView() {
        view.setGradientBackground(colorOne: .white , colorTwo: .black)
        
        colorView.backgroundColor = colorValue
        colorView.layer.cornerRadius = 15
    }
    
    private func setSliderStartValue() {
        redSlider.value = setupRedSliderValue
        greenSlider.value = setupGreenSliderValue
        blueSlider.value = setupBlueSliderValue
        
    }
    
    private func setColor() {
        setValueLabels()
        setValueTextFields()
        
        colorView.backgroundColor = UIColor(
            red:CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValueLabels() {
        redLabel.text = string(redSlider)
        greenLabel.text = string(greenSlider)
        blueLabel.text = string(blueSlider)
        
    }
    
    private func setValueTextFields() {
        redTextField.text = string(redSlider)
        greenTextField.text = string(greenSlider)
        blueTextField.text = string(blueSlider)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
    }
    
    private func string(_ slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    
    //MARK: - IBActions
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender.tag {
        case 0:
            animator.fractionComplete = CGFloat(redSlider.value)
            changeColorViewAndButton()
        case 1:
            animator.fractionComplete = CGFloat(greenSlider.value)
            changeColorViewAndButton()
        case 2:
            animator.fractionComplete = CGFloat(blueSlider.value)
            changeColorViewAndButton()
        default:
            break
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        animator.startAnimation()
        
        delegate.changeViewColor(colorSetting)
        delegate.changeSliderValu(red: redSliderValue,
                                  green: greenSliderValue,
                                  blue: blueSliderValue)
        
        dismiss(animated: true)
    }
    
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let value = Float(text) {
            switch textField.tag {
            case 0:
                redSlider.setValue(value, animated: true)
            case 1:
                greenSlider.setValue(value, animated: true)
            case 2:
                blueSlider.setValue(value, animated: true)
            default:
                break
            }
            
        } else {
            showAlert()
        }
        
        setColor()
    }
    
}



