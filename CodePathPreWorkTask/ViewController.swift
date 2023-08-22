//
//  ViewController.swift
//  CodePathPreWorkTask
//
//  Created by Alena Tochilkina on 08.08.2023.
//

import UIKit

enum Brightness {
    case light, dark
}

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    // changes the backgorund color
    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        
        let randomColor = changeColor()
        
        setTextColorMode(randomColor)
        view.backgroundColor = randomColor
        
    }
    
    // sets the background color to white
    @IBAction func returnOriginalColor(_ sender: UIButton) {
        let defauldBackgroundColor = UIColor.white
        
        setTextColorMode(defauldBackgroundColor)
        view.backgroundColor = defauldBackgroundColor;
    }
    
    // generates a random color
    func changeColor() -> UIColor{

        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let alpha = CGFloat.random(in: 0...1)

        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    // sets the textcolor based on the background of its superview
    func setTextColorMode(_ backgroundColor: UIColor){
        switch(determineBrightness(color: backgroundColor)){
        case .light:
            nameLabel.textColor = .black
            schoolLabel.textColor = .black
            jobLabel.textColor = .black
        case .dark:
            nameLabel.textColor = .white
            schoolLabel.textColor = .white
            jobLabel.textColor = .white
        }
    }
    
    // determine the brightness of the color
    // the formula is taken from: https://www.w3.org/WAI/ER/WD-AERT/#color-contrast
    func determineBrightness(color: UIColor) -> Brightness {
        var red: CGFloat = 0
        var blue: CGFloat = 0
        var green: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let brightness = ((red * 299) + (green * 587) + (blue * 114)) / 1000

        return (brightness > 0.5) ? .light : .dark
    }

}

