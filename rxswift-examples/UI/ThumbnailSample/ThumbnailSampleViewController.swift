//
//  ThumbnailSampleViewController.swift
//  rxswift-examples
//
//  Copyright © 2016年 53ningen. All rights reserved.

import UIKit
import RxSwift

class ThumbnailSampleViewController: UIViewController {
    
    private var disposeBag: DisposeBag = DisposeBag()
    fileprivate let httpClient: RxHttpClient = DefaultRxHttpClient(defaultTimeoutSec: 10)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(ThumbnailCell.self)
    }
    
}

extension ThumbnailSampleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithType(ThumbnailCell.self) ?? ThumbnailCell()
        cell.disposeBag = DisposeBag()
        cell.thumbnailImageView.image = nil
        let url = URL(string: "https://placeholdit.imgix.net/~text")!
        let params: [RequestParameter] = [("txtsize", "33"), ("txt", (indexPath as NSIndexPath).row.description), ("w", "99"), ("h", "70")]
        httpClient.get(url, parameters: params, headers: nil, timeoutSec: nil)
            .observeOn(MainScheduler.instance)
            .subscribe({ (event) in
                switch event {
                case .next(let element):
                    cell.thumbnailImageView.rx.image.onNext(UIImage(data: element.0 as Data))
                case .error(let e as NSError):
                    NSLog(e.localizedDescription)
                default: break
                }
            })
            .addDisposableTo(cell.disposeBag)
        return cell
    }
    
}

extension ThumbnailSampleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
