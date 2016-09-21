//
//  ViewController.swift
//  rxswift-examples
//
//  Copyright © 2015年 53ningen. All rights reserved.
//

import RxSwift
import UIKit

class ViewController: UIViewController {

    private var disposeBag: DisposeBag = DisposeBag()
    
    @IBOutlet weak var buttonSampleButton: UIButton!
    @IBOutlet weak var textFieldSampleButton: UIButton!
    @IBOutlet weak var sliderSampleButton: UIButton!
    @IBOutlet weak var thumbnailSampleButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        buttonSampleButton.rx.tap
            .subscribe(onNext: {
                let vc: ButtonSampleViewController = Storyboard.getViewController(.ButtonSample)
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .addDisposableTo(disposeBag)
        textFieldSampleButton.rx.tap
            .subscribe(onNext: {
                let vc: TextFieldSampleViewController = Storyboard.getViewController(.TextFieldSample)
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .addDisposableTo(disposeBag)
        sliderSampleButton.rx.tap
            .subscribe(onNext: {
                let vc: SliderSampleViewController = Storyboard.getViewController(.SliderSample)
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .addDisposableTo(disposeBag)
        thumbnailSampleButton.rx.tap
            .subscribe(onNext: {
                let vc: ThumbnailSampleViewController = Storyboard.getViewController(.ThumbnailSample)
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .addDisposableTo(disposeBag)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disposeBag = DisposeBag()
    }

}

