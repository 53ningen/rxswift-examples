//
//  TextFieldSampleViewController.swift
//  rxswift-examples
//
//  Copyright © 2015年 53ningen. All rights reserved.
//

import RxSwift
import UIKit

class TextFieldSampleViewController: UIViewController {
    
    private var disposeBag: DisposeBag = DisposeBag()
    @IBOutlet weak var textField: UITextField!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.rx.textInput.text
            //.filter { $0 == "ココア" }
            .map { "はぁ... \(String(describing: $0)) さん..." }
            .subscribe(onNext: { NSLog($0) })
            .addDisposableTo(disposeBag)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disposeBag = DisposeBag()
    }


}
