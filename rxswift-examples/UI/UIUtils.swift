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
        return NSStringFromClass(self).components(separatedBy: ".").last! as String
    }
    
    func getClassName() -> String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last! as String
    }
    
}

extension UIView {
    
    static func getUINib() -> UINib {
        return UINib(nibName: getClassName(), bundle: Bundle.main)
    }
    
    static func getInstance<T: UIView>(_ t: T.Type) -> T? {
        return T.getUINib().instantiate(withOwner: nil, options: nil).first as? T
    }
    
    func roundedCorners(_ cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
    
    func border(_ width: CGFloat, color: CGColor) {
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
    
    func registerNib(_ cls: UITableViewCell.Type) {
        register(cls.getUINib(), forCellReuseIdentifier: cls.cellReuseIdentifier)
    }
    
    func dequeueReusableCellWithType<T: UITableViewCell>(_ cls: UITableViewCell.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cls.cellReuseIdentifier) as? T
    }

    
}

extension UIViewController {
    
    static func of<T: UIViewController>(_ cls: T.Type) -> T {
        return UIStoryboard(name: cls.getClassName(), bundle: Bundle.main).instantiateViewController(withIdentifier: cls.getClassName()) as! T
    }
    
}
