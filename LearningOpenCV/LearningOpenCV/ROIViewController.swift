//
//  ROIViewController.swift
//  LearningOpenCV
//
//  Created by CatchZeng on 2018/6/25.
//  Copyright © 2018年 catch. All rights reserved.
//

import UIKit

class ROIViewController: UIViewController {

    @IBOutlet weak var resultImageView: UIImageView!
    private let logo = #imageLiteral(resourceName: "logo")
    private let sayHello = #imageLiteral(resourceName: "sayHello")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultImageView.image = OpenCV.add(#imageLiteral(resourceName: "logo"), alphaExist: true, on: #imageLiteral(resourceName: "sayHello"), atPosition: CGPoint(x: 330, y: 0), alpha: 1.0, beta: 1.0, gamma: 0)
    }
    
    @IBAction func onSliderValueChanged(_ sender: UISlider) {
        resultImageView.image = OpenCV.add(#imageLiteral(resourceName: "logo"), alphaExist: true, on: #imageLiteral(resourceName: "sayHello"), atPosition: CGPoint(x: 330, y: 0), alpha: 1.0, beta: CGFloat(sender.value), gamma: 0)
    }
}
