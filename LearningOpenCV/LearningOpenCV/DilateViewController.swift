//
//  DilateViewController.swift
//  LearningOpenCV
//
//  Created by CatchZeng on 2018/9/28.
//  Copyright © 2018 catch. All rights reserved.
//

import UIKit

class DilateViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultImageView: UIImageView!
    
    private var sizeX: Int32 = 3
    private var sizeY: Int32 = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSliderValueChanged(_ sender: UISlider) {
        sizeX = Int32(sender.value)
        transform()
    }
    
    @IBAction func onSlider2ValueChanged(_ sender: UISlider) {
        sizeY = Int32(sender.value)
        transform()
    }
    
    private func transform() {
        if sizeX == 0 && sizeY == 0 {
            resultImageView.image = imageView.image
        } else {
            if sizeX%2 == 0 {
                sizeX = sizeX + 1
            }
            if sizeY%2 == 0 {
                sizeY = sizeY + 1
            }
            let image = OpenCV.dilate(imageView.image, sizeX: sizeX, sizeY: sizeY)
            resultImageView.image = image
        }
    }
}
