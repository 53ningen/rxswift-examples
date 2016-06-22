//
//  UIViewExt.swift
//  rxswift-examples
//
//  Copyright © 2016年 53ningen. All rights reserved.
//

import UIKit
import Foundation

extension NSObject {
    
    static func getClassName() -> String {
        return NSStringFromClass(self).componentsSeparatedByString(".").last! as String
    }
    
    func getClassName() -> String {
        return NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last! as String
    }
    
}

extension UIView {
    
    static func getUINib() -> UINib {
        return UINib(nibName: getClassName(), bundle: NSBundle.mainBundle())
    }
    
    static func getInstance<T: UIView>(t: T.Type) -> T? {
        return T.getUINib().instantiateWithOwner(nil, options: nil).first as? T
    }
    
    func roundedCorners(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
    
    func border(width: CGFloat, color: CGColor) {
        layer.borderWidth = width
        layer.borderColor = color
    }
    
}

extension UITableViewCell {
    
    static var cellReuseIdentifier: String {
        return self.getClassName()
    }
    
}

extension UITableView {
    
    func registerNib(cls: UITableViewCell.Type) {
        registerNib(cls.getUINib(), forCellReuseIdentifier: cls.cellReuseIdentifier)
    }
    
    func dequeueReusableCellWithType<T: UITableViewCell>(cls: UITableViewCell.Type) -> T? {
        return dequeueReusableCellWithIdentifier(cls.cellReuseIdentifier) as? T
    }

    
}

extension UIViewController {
    
    static func of<T: UIViewController>(cls: T.Type) -> T {
        return UIStoryboard(name: cls.getClassName(), bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier(cls.getClassName()) as! T
    }
    
}
