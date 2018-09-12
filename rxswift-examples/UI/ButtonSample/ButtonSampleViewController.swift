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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        button.rx.tap
            .subscribe(onNext: { NSLog("チマメ隊") })
            .disposed(by: disposeBag)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disposeBag = DisposeBag()
    }
    
}
