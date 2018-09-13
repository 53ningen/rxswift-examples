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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        slider.rx.value
            .map {
                NSAttributedString(
                    string: "特殊相対性理論",
                    attributes: [NSAttributedStringKey.font: UIFont(name: "Hiragino Kaku Gothic ProN", size: CGFloat($0))!]
                )
            }
            .bind(to: label.rx.attributedText)
            .disposed(by: disposeBag)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disposeBag = DisposeBag()
    }

}
