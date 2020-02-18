//
//  ViewController.swift
//  HomeWork_2.6
//
//  Created by Macbook on 13.02.2020.
//  Copyright © 2020 Alex Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Public properties
    //сюда передаю значения view.background из StartViewController
    var colorValue: UIColor!
    
    //сюда передаю значения слайдера из StartViewController
    var setupRedSliderValue: Float!
    var setupGreenSliderValue: Float!
    var setupBlueSliderValue: Float!
    
    //Delegate properties
    var delegate: ColorSettingDelegate!
    //свойсвто протокола для передачи цвета в view.background из StartViewController
    var colorSetting: UIColor {
        UIColor (
            red:CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    //MARK: - Private properties
    private let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
    
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
    
    @IBOutlet weak var sunImageViewCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var colorViewCenterConstraint: NSLayoutConstraint!
    

    
    //MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
        setupImageViewAnimatorDidApear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackground(colorOne: .white , colorTwo: .black)
        
        changeColorView()
        
        textFieldSelfDelegate()
        setSliderColorViewButtonStartValue()
        setValueLabels()
        setValueTextFields()
        
        addDoneButtonTo(redTextField)
        addDoneButtonTo(greenTextField)
        addDoneButtonTo(blueTextField)
        
        setupImageViewAnimator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        
           sunImageViewCenterConstraint.constant -= view.bounds.width
           colorViewCenterConstraint.constant -= view.bounds.width
    }
    
    
    //MARK: - Private Methods
    //ImageView animation
    private func setupImageViewAnimator() {
        animator.addAnimations {
            self.sunImageView.transform = CGAffineTransform(rotationAngle: 10)
            self.secondSunImageView.transform = CGAffineTransform(rotationAngle: -10)
        }
    }
    
    private func setupImageViewAnimatorDidApear() {
        
        let options: UIView.AnimationOptions = [.curveEaseInOut,
                                                .repeat,
                                                .autoreverse]
        
        UIView.animate(withDuration: 2.9,
                       delay: 0,
                       options: options,
                       animations: { [weak self] in
                        self?.colorView.frame.size.height *= 1.3
                        self?.colorView.frame.size.width *= 1.3
            }, completion: nil)
        
        colorViewCenterConstraint.constant = 0
        
        UIView.animate(withDuration: 0.7) { [weak self] in
            self?.view.layoutIfNeeded()
        }
        
        sunImageViewCenterConstraint.constant = 0
        
        UIView.animate(withDuration: 0.7,
                       delay: 0.3,
                       options: [.curveEaseInOut],
                       animations: { [weak self] in
                        self?.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    private func changeImageViewAndButtonColors() {
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
    
    private func textFieldSelfDelegate() {
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    private func changeColorView() {
        //передаю цвет view.background из StartViewController в наш imageView
        colorView.backgroundColor = colorValue
        colorView.layer.cornerRadius = 15
    }
    
    private func setSliderColorViewButtonStartValue() {
        redSlider.value = setupRedSliderValue
        greenSlider.value = setupGreenSliderValue
        blueSlider.value = setupBlueSliderValue
        
        colorView.backgroundColor = UIColor(
            red:CGFloat(setupRedSliderValue),
            green: CGFloat(setupGreenSliderValue),
            blue: CGFloat(setupBlueSliderValue),
            alpha: 1)
        
        sunImageView.tintColor = UIColor(
           red:CGFloat(setupRedSliderValue),
           green: CGFloat(setupGreenSliderValue),
           blue: CGFloat(setupBlueSliderValue),
           alpha: 1)
        
        secondSunImageView.tintColor = UIColor(
             red:CGFloat(setupRedSliderValue),
             green: CGFloat(setupGreenSliderValue),
             blue: CGFloat(setupBlueSliderValue),
             alpha: 1)
        
        buttonLabel.titleLabel?.textColor = UIColor (
             red:CGFloat(setupRedSliderValue),
             green: CGFloat(setupGreenSliderValue),
             blue: CGFloat(setupBlueSliderValue),
             alpha: 1)
        
    }
    
    private func setColor() {
        setValueLabels()
        setValueTextFields()
        setSliderValue()
        
        colorView.backgroundColor = UIColor(
            red:CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setSliderValue() {
        setupRedSliderValue = redSlider.value
        setupGreenSliderValue = greenSlider.value
        setupBlueSliderValue = blueSlider.value
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
    }
    
    private func string(_ slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    
    //MARK: - IBActions
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        //свитч только для анимации
        switch sender.tag {
        case 0:
            animator.fractionComplete = CGFloat(redSlider.value)
            changeImageViewAndButtonColors()
        case 1:
            animator.fractionComplete = CGFloat(greenSlider.value)
            changeImageViewAndButtonColors()
        case 2:
            animator.fractionComplete = CGFloat(blueSlider.value)
            changeImageViewAndButtonColors()
        default:
            break
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        animator.stopAnimation(true)
        
        delegate.changeViewColor(to: colorSetting)

        delegate.changeSliderValu(red: setupRedSliderValue,
                                      green: setupGreenSliderValue,
                                      blue: setupBlueSliderValue)
        
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



