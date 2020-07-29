# SFJNameSpaceDemo

## 快速的添加自己的命名空间

### 1. 添加包装壳的结构体

``` Swift
// 包装对象
public struct SFJWrapper<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}
```
### 2. 为类添加命名空间
``` Swift
// 为对象添加 sfj
public protocol SFJCompatible: AnyObject { }
extension SFJCompatible {
    public var sfj: SFJWrapper<Self> {
        get {return SFJWrapper(self)}
        set {}
    }
}
```

### 3. 为值类型添加命名空间
``` Swift
// 为值类型添加 sfj
public protocol SFJCompatibleValue {}
extension SFJCompatibleValue {
    public var sfj: SFJWrapper<Self> {
        get {return SFJWrapper(self)}
        set {}
    }
}
```

## 使用举例: 假如我们需要为我们的UIImage添加扩展

### 1. 让UIImage 遵循 SFJCompatible 协议（有命名空间了）
``` Swift
extension UIImage: SFJCompatible {}
```

### 2. 为我们定义的包装对象添加扩展 限制条件是 我们包装的Base 是 UIImage 类型

``` Swift
extension SFJWrapper where Base: UIImage {
    func crop(rect: CGRect) -> UIImage? {
        nil
    }
}
```

## 通过命名空间调用扩展方法
``` Swift
let image = UIImage(named: "")
let cropImg = image?.sfj.crop(rect: .zero)
```

## 感谢

感谢🐱神 无私奉献Kingfisher，此处只是提取了一点Kingfisher的经典





