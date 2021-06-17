//
//  UICollectionView+.swift
//  SFJNameSpaceDemo
//
//  Created by Shafujiu on 2021/6/17.
//  Copyright © 2021 Shafujiu. All rights reserved.
//
import UIKit

extension UICollectionView {
    func registerClass<T: UICollectionViewCell>(_ cellType: T.Type, resuseIdentifier: String = T.reuseIdentifier) {
        register(cellType, forCellWithReuseIdentifier: resuseIdentifier)
    }
    func registerNib<T: UICollectionViewCell>(_ cellType: T.Type, reuseIdentifier: String = T.reuseIdentifier) {
        register(UINib(nibName: cellType.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func dequeueReusableCellClass<T: UICollectionViewCell>(for indexPath: IndexPath, reuseIdentifier: String = T.reuseIdentifier) -> T {
        (dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? T)!
    }
    
}

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
