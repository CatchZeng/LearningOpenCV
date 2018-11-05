//
//  BlackHatViewController.swift
//  LearningOpenCV
//
//  Created by CatchZeng on 2018/11/5.
//  Copyright © 2018 catch. All rights reserved.
//

import Foundation
import UIKit

class BlackHatViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelX: UILabel!
    @IBOutlet weak var labelY: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    
    private var sizeX: Int32 = 3
    private var sizeY: Int32 = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSliderValueChanged(_ sender: UISlider) {
        sizeX = Int32(sender.value)
        labelX.text = "\(sizeX)"
        transform()
    }
    
    @IBAction func onSlider2ValueChanged(_ sender: UISlider) {
        sizeY = Int32(sender.value)
        labelY.text = "\(sizeY)"
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
            let image = OpenCV.blackHat(imageView.image, sizeX: sizeX, sizeY: sizeY)
            resultImageView.image = image
        }
    }
}
