//
//  SayHelloViewController.swift
//  LearningOpenCV
//
//  Created by CatchZeng on 2018/6/13.
//  Copyright © 2018年 catch. All rights reserved.
//

import UIKit

class SayHelloViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var grayImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grayImageView.image = OpenCV.cutout(#imageLiteral(resourceName: "sayHello"))
    }
}
