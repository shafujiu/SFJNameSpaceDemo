//
//  ViewController.swift
//  SFJNameSpaceDemo
//
//  Created by Shafujiu on 2020/7/29.
//  Copyright © 2020 Shafujiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "")
        let cropImg = image?.sfj.crop(rect: .zero)
    }
    
}

