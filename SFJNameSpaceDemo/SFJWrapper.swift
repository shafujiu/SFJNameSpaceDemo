//
//  SFJWrapper.swift
//  SFJNameSpaceDemo
//
//  Created by Shafujiu on 2020/7/29.
//  Copyright © 2020 Shafujiu. All rights reserved.
//

import UIKit
// 包装对象
public struct SFJWrapper<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}
// 为对象添加 sfj
public protocol SFJCompatible: AnyObject { }
// 为值类型添加 sfj
public protocol SFJCompatibleValue {}

extension SFJCompatible {
    public var sfj: SFJWrapper<Self> {
        get {return SFJWrapper(self)}
        set {}
    }
}

extension SFJCompatibleValue {
    public var sfj: SFJWrapper<Self> {
        get {return SFJWrapper(self)}
        set {}
    }
}

