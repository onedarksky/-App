//
//  PrintPhoto.swift
//  製作拍立得 App
//
//  Created by Jiang Yung Tse on 2021/11/16.
//

import UIKit

class PrintPhoto: UIViewController {
    
    @IBOutlet weak var BlankView: UIView!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var ClipView: UIView!
    
    @IBOutlet weak var MessageLabel: UILabel!
    
    //顏色漸層
    func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            CGColor(srgbRed: 0.2, green: 0.4, blue: 0.6, alpha: 1),
            CGColor(srgbRed: 0.3, green: 0, blue: 0.3, alpha: 1)]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        
        MessageLabel.text = photoText
        var width : CGFloat = 375
        var height : CGFloat = 375
        if ratio == "1 : 1" {
            width = 275
            height = width
        }
        else if ratio == "3 : 4" {
            width = 275
            height = width / 3 * 4
        }
        else if ratio == "16 : 9"{
            width = 275
            height = width / 16 * 9
        }
        //設定動畫
        BlankView.frame.size.height = height + 110
        ClipView.frame = CGRect(x: (BlankView.frame.width-width)/2, y: 20, width: width, height: height)
        ImageView.frame = CGRect(x: -(view.frame.width-width)/2, y: -(view.frame.width-height)/2, width: 375, height: 375)
        MessageLabel.frame.origin.y = ClipView.frame.maxY + 5

  
        let blankViewHight = self.BlankView.frame.size.height
        let messageY = MessageLabel.frame.origin.y
        let subViewY = messageY - 5 - ClipView.frame.height
        
        self.BlankView.frame.size.height = 0
        self.MessageLabel.frame.origin.y = -85
        self.ClipView.frame.origin.y = -90 - ClipView.frame.height
        UIView.animate(withDuration: 2) {
            self.BlankView.frame.size.height = blankViewHight
            self.MessageLabel.frame.origin.y = messageY
            self.ClipView.frame.origin.y = subViewY
        }
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
