//
//  MixViewController.swift
//  LearningOpenCV
//
//  Created by CatchZeng on 2018/6/20.
//  Copyright © 2018年 catch. All rights reserved.
//

import UIKit

class MixViewController: UIViewController {

    @IBOutlet weak var resultImageView: UIImageView!
    private let ake = UIImage(named: "ake")
    private let houyi = UIImage(named: "houyi")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultImageView.image = OpenCV.addWeighted(ake, image2: houyi, alpha: 1, gamma: 1)
    }
    
    @IBAction func onSliderValueChanged(_ sender: UISlider) {
        let alpha = Double(sender.value)
        resultImageView.image = OpenCV.addWeighted(ake, image2: houyi, alpha: alpha, gamma: (1.0 - alpha))
    }
}
