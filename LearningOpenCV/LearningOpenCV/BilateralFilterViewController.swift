//
//  BilateralFilterViewController.swift
//  LearningOpenCV
//
//  Created by CatchZeng on 2018/8/22.
//  Copyright © 2018年 catch. All rights reserved.
//

import UIKit

class BilateralFilterViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var blurImageView: UIImageView!
    @IBOutlet weak var gBlurImageView: UIImageView!
    @IBOutlet weak var resultImageView: UIImageView!
    
    private var d: Int32 = 1
    private var color: Double = 1.0
    private var space: Double = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurImageView.image = OpenCV.blur(imageView.image, sizeX: 3, sizeY: 3)
        gBlurImageView.image = OpenCV.gaussianblur(imageView.image, sizeX: 3, sizeY: 3)
    }

    @IBAction func onSliderValueChanged(_ sender: UISlider) {
        d = Int32(sender.value)
        transform()
    }
    
    @IBAction func onSlider2ValueChanged(_ sender: UISlider) {
        color = Double(sender.value)
        transform()
    }
    
    @IBAction func onSlider3ValueChanged(_ sender: UISlider) {
        space = Double(sender.value)
        transform()
    }
    
    private func transform() {
        resultImageView.image = OpenCV.bilateralFilter(imageView.image, d: d, sigmaColor: color, sigmaSpace: space)
    }
}
