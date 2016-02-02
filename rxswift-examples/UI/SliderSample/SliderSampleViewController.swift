//
//  SliderSampleViewController.swift
//  rxswift-examples
//
//  Copyright © 2015年 53ningen. All rights reserved.
//

import RxSwift
import UIKit

class SliderSampleViewController: UIViewController {

    private var disposeBag: DisposeBag = DisposeBag()
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        slider.rx_value
            .map {
                NSAttributedString(
                    string: "特殊相対性理論",
                    attributes: [NSFontAttributeName: UIFont(name: "Hiragino Kaku Gothic ProN", size: CGFloat($0))!]
                )
            }
            .bindTo(label.rx_attributedText)
            .addDisposableTo(disposeBag)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        disposeBag = DisposeBag()
    }

}
