import RxSwift
import Foundation

public typealias RequestParameter = (key: String, value: String)
public typealias RequestHeader = (key: String, value: String)

public protocol RxHttpClient {
    
    func get(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData!, NSHTTPURLResponse)>
    
    func post(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData!, NSHTTPURLResponse)>
    
    func put(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData!, NSHTTPURLResponse)>
    
    func delete(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData!, NSHTTPURLResponse)>
    
    func execute(method: HttpMethod, url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData!, NSHTTPURLResponse)>
    
}
