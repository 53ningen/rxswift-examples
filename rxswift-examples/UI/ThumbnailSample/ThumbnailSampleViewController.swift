//
//  ThumbnailSampleViewController.swift
//  rxswift-examples
//
//  Copyright © 2016年 53ningen. All rights reserved.

import UIKit
import RxSwift

class ThumbnailSampleViewController: UIViewController {
    
    private var disposeBag: DisposeBag = DisposeBag()
    private let httpClient: RxHttpClient = DefaultRxHttpClient(defaultTimeoutSec: 10)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(ThumbnailCell)
    }
    
}

extension ThumbnailSampleViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithType(ThumbnailCell) ?? ThumbnailCell()
        let url = NSURL(string: "https://placeholdit.imgix.net/~text")!
        let params: [RequestParameter] = [("txtsize", "33"), ("txt", indexPath.row.description), ("w", "99"), ("h", "70")]
        httpClient.get(url, parameters: params, headers: nil, timeoutSec: nil)
            .observeOn(MainScheduler.instance)
            .subscribe({ (event) in
                switch event {
                case .Next(let element):
                    cell.thumbnailImageView.rx_image.onNext(UIImage(data: element.0))
                case .Error(let e as NSError):
                    NSLog(e.localizedDescription)
                default: break
                }
            })
            .addDisposableTo(cell.disposeBag)
        return cell
    }
    
}

extension ThumbnailSampleViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
