//
//  UIImage+Extension.swift
//  SFJNameSpaceDemo
//
//  Created by Shafujiu on 2020/7/29.
//  Copyright © 2020 Shafujiu. All rights reserved.
//

import UIKit
// 为UIImage 添加命名空间
// 第一步
extension UIImage: SFJCompatible {}
// 第二步
extension SFJWrapper where Base: UIImage {
    func crop(rect: CGRect) -> UIImage? {
        nil
    }
}
