//
//  LineViewController.swift
//  LearningOpenCV
//
//  Created by CatchZeng on 2018/11/5.
//  Copyright © 2018 catch. All rights reserved.
//

import Foundation

class LineViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transform()
    }
    
    private func transform() {
        let image = OpenCV.gray(imageView.image)
        
        let thresholdImage = OpenCV.threshold(image, thresh: 200);
        
        let thresholdNegation = OpenCV.negation(thresholdImage)
        
        let cols = OpenCV.cols(thresholdNegation)
        
        let open = OpenCV.open(thresholdNegation, sizeX: cols/40, sizeY: 1)
        
        let result = OpenCV.negation(open)
        
        resultImageView.image = result
    }
}
