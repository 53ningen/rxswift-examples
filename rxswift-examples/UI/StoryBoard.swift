//
//  StoryBoard.swift
//  rxswift-examples
//
//  Copyright © 2015年 53ningen. All rights reserved.
//

import UIKit
import Foundation

internal enum Storyboard: String {
    
    case ButtonSample = "ButtonSample"
    case TextFieldSample = "TextFieldSample"
    case SliderSample = "SliderSample"
    
    internal static func getViewController<T: UIViewController>(storyboardId: Storyboard) -> T {
        let storyBoard = UIStoryboard(name: storyboardId.rawValue, bundle: NSBundle.mainBundle())
        return storyBoard.instantiateInitialViewController() as! T
    }
    
}