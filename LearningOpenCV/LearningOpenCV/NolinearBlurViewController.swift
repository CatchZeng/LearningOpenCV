//
//  NolinearBlurViewController.swift
//  LearningOpenCV
//
//  Created by CatchZeng on 2018/8/22.
//  Copyright © 2018年 catch. All rights reserved.
//

import UIKit

class NolinearBlurViewController: UIViewController {

    @IBOutlet weak var resultImageView: UIImageView!
    let image = #imageLiteral(resourceName: "ddkai")
    
    @IBAction func onSliderValueChanged(_ sender: UISlider) {
        resultImageView.image = OpenCV.medianBlur(self.image, size: Int32(Int(sender.value)))
    }
}
