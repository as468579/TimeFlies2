//
//  AViewController.swift
//  Years
//
//  Created by User02 on 2019/1/24.
//  Copyright © 2019 Chiafishh. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    var timer : Timer?
    var clickAuto = 0
    var timeImgYear = 85
    var alphaImg:Float = 0
    var delayYear = 0
    
    @IBOutlet var ChooseImg: UIImageView!
    @IBOutlet var ChooseImg2: UIImageView!
    @IBOutlet var YearSlider: UISlider!
    @IBOutlet var YearLabel: UILabel!    
    @IBOutlet var autoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChooseImg2.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func YearSliderFunc(_ sender: Any) {
        YearLabel.text = String(Int(YearSlider.value))
        ChooseImg.image = UIImage(named: "\(Int(YearSlider.value)).png")
        alphaImg = Float(YearSlider.value) - Float(Int(YearSlider.value))
        if alphaImg > 0.8{
            ChooseImg2.image = UIImage(named: "\(Int(YearSlider.value)+1).png")
            ChooseImg2.isHidden = false
        }
        else{
            ChooseImg2.isHidden = true
        }
        print(Float(YearSlider.value))
    }
    
    @IBAction func ClickAutoButton(_ sender: Any) {
        if clickAuto == 0{
            clickAuto = 1
            autoButton.setTitle("停止",for: .normal)
            timeImgYear = Int(YearSlider.value)
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeFunc), userInfo: nil, repeats: true)
        }
        else{
            clickAuto = 0
            autoButton.setTitle("自動",for: .normal)
            if timer != nil {
                timer?.invalidate()
            }
        }
    }
    @objc func timeFunc() {
        //print("123")
        print(timeImgYear)

        YearLabel.text = "\(timeImgYear)"
        YearSlider.value = Float(timeImgYear)
        //ChooseImg2.isHidden = true
        ChooseImg.image = UIImage(named: "\(timeImgYear).png")
        
        delayYear = timeImgYear - 1
        /*print("delay")
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.ChooseImg2.image = UIImage(named: "\(self.delayYear).png")
            self.ChooseImg2.isHidden = false
        })
        print("delayE")
        ChooseImg2.isHidden = true*/

        if timeImgYear < 108{
            timeImgYear += 1
        }
        else{
            timeImgYear = 85
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
