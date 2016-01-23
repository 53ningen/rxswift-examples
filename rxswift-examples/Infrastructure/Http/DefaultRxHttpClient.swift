import RxSwift
import RxCocoa
import Foundation

public class DefaultRxHttpClient: RxHttpClient {
    
    private let defaultTimeoutSec: NSTimeInterval
    
    public init(defaultTimeoutSec: NSTimeInterval) {
        self.defaultTimeoutSec = defaultTimeoutSec
    }
    
    public func get(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval? = nil) -> Observable<(NSData, NSHTTPURLResponse)> {
        return action(.GET, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    public func post(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval? = nil) -> Observable<(NSData, NSHTTPURLResponse)> {
        return action(.POST, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    public func put(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval? = nil) -> Observable<(NSData, NSHTTPURLResponse)> {
        return action(.PUT, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    public func delete(url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval? = nil) -> Observable<(NSData, NSHTTPURLResponse)> {
        return action(.DELETE, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    public func execute(method: HttpMethod, url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData, NSHTTPURLResponse)> {
        return action(method, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    private func action(method: HttpMethod, url: NSURL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval?) -> Observable<(NSData, NSHTTPURLResponse)> {
        if let request = RxHttpUtils.createRequest(method, url: url, params: parameters, headers: headers, timeoutSec: timeoutSec ?? defaultTimeoutSec) {
            return NSURLSession.sharedSession().rx_response(request)
        } else {
            return Observable.error(NSError(domain: "RxHttp", code: 1, userInfo: nil))
        }
    }
    
}
