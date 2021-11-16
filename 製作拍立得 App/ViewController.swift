//
//  ViewController.swift
//  製作拍立得 App
//
//  Created by Jiang Yung Tse on 2021/11/16.
//

import UIKit

var ratio = "1 : 1"

var photoText = ""

class ViewController: UIViewController {
    
    @IBOutlet weak var ClipView: UIView!
    
    @IBOutlet weak var ImageView: UIImageView!
    

    //顏色漸層
    func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            CGColor(srgbRed: 0.8, green: 0.3, blue: 0.1, alpha: 1),
            CGColor(srgbRed: 0.3, green: 0.2, blue: 0.6, alpha: 1)]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidLoad() {
        setupGradientBackground()
        super.viewDidLoad()
    }

    @IBAction func CloseKeyboard(_ sender: UITextField) {
        photoText = sender.text!
    }
    
    @IBAction func SizeButton(_ sender: UIButton) {
        var width: CGFloat = 375
        var height: CGFloat = 375
        
        if sender.currentTitle == "1 : 1" {
            ratio = "3 : 4"
            width = 275
            height = width / 3 * 4
        }else if sender.currentTitle == "3 : 4" {
            ratio = "16 : 9"
            width = 275
            height = width / 16 * 9
        }else {
            ratio = "1 : 1"
            width = 275
            height = width
        }
        sender.setTitle(ratio, for: UIControl.State.normal)
        
        ClipView.frame = CGRect(x: (view.frame.width-width)/2, y: 120+(view.frame.width-height)/2, width: width, height: height)
        
        ImageView.frame = CGRect(x: -(view.frame.width-width)/2, y: -(view.frame.width-height)/2, width: 375, height: 375)
    }
}
