//
//  TransformViewController.swift
//  LearningOpenCV
//
//  Created by CatchZeng on 2018/7/3.
//  Copyright © 2018 catch. All rights reserved.
//

import UIKit
import Foundation

class TransformViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultImageView: UIImageView!
    
    private var light: Float = 0.0
    private var contrast: Float = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSliderValueChanged(_ sender: UISlider) {
        light = sender.value
        transform()
    }
    
    @IBAction func onSlider2ValueChanged(_ sender: UISlider) {
        contrast = sender.value
        transform()
    }
    
    private func transform() {
        let image = OpenCV.transform(imageView.image,
                                     alpha: Double(contrast),
                                     beta:Double(light));
        resultImageView.image = image
    }
}
