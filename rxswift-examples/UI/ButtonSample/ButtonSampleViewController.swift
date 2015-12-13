//
//  ButtonSampleViewController.swift
//  rxswift-examples
//
//  Copyright © 2015年 53ningen. All rights reserved.
//

import RxSwift
import UIKit

class ButtonSampleViewController: UIViewController {

    private var disposeBag: DisposeBag = DisposeBag()
    @IBOutlet weak var button: UIButton!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        button.rx_tap
            .subscribeNext { NSLog("チマメ隊") }
            .addDisposableTo(disposeBag)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        disposeBag = DisposeBag()
    }
    
}
