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
    case ThumbnailSample = "ThumbnailSample"
    
    internal static func getViewController<T: UIViewController>(_ storyboardId: Storyboard) -> T {
        let storyBoard = UIStoryboard(name: storyboardId.rawValue, bundle: Bundle.main)
        return storyBoard.instantiateInitialViewController() as! T
    }
    
}
