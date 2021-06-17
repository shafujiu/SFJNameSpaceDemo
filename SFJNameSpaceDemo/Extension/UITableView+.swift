//
//  UITableView+.swift
//  SFJNameSpaceDemo
//
//  Created by Shafujiu on 2021/6/18.
//  Copyright © 2021 Shafujiu. All rights reserved.
//

import UIKit
extension UITableView {
    
    func registerClass<T: UITableViewCell>(_ cellType: T.Type, reuseIdentifier: String = T.reuseIdentifier) {
        register(cellType, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func registerNib<T: UITableViewCell>(_ cellType: T.Type, reuseIdentifier: String = T.reuseIdentifier) {
        register(UINib(nibName: cellType.reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    
    func dequeueReusableCellClass<T: UITableViewCell>(for indexPath: IndexPath, reuseIdentifier: String = T.reuseIdentifier) -> T {
        (dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T)!
    }
}


extension UITableViewCell {

    static var reuseIdentifier: String {
        String(describing: self)
    }
}
