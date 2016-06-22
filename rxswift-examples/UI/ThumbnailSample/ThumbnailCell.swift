//
//  ThumbnailCell.swift
//  rxswift-examples
//
//  Copyright © 2016年 53ningen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Foundation

class ThumbnailCell: UITableViewCell {
    
    var disposeBag: DisposeBag = DisposeBag()
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
}
