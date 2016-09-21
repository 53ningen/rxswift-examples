import RxSwift
import RxCocoa
import Foundation

class DefaultRxHttpClient: RxHttpClient {
    
    private let defaultTimeoutSec: TimeInterval
    
    init(defaultTimeoutSec: TimeInterval) {
        self.defaultTimeoutSec = defaultTimeoutSec
    }
    
    func get(_ url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval?) -> Observable<(Data, HTTPURLResponse)> {
        return action(.GET, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    func post(_ url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval? = nil) -> Observable<(Data, HTTPURLResponse)> {
        return action(.POST, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    func put(_ url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval? = nil) -> Observable<(Data, HTTPURLResponse)> {
        return action(.PUT, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    func delete(_ url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval? = nil) -> Observable<(Data, HTTPURLResponse)> {
        return action(.DELETE, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    func execute(_ method: HttpMethod, url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval?) -> Observable<(Data, HTTPURLResponse)> {
        return action(method, url: url, parameters: parameters, headers: headers, timeoutSec: timeoutSec)
    }
    
    private func action(_ method: HttpMethod, url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval?) -> Observable<(Data, HTTPURLResponse)> {
        if let request = RxHttpUtils.createRequest(method, url: url as URL, params: parameters, headers: headers, timeoutSec: timeoutSec ?? defaultTimeoutSec) {
            return URLSession.shared.rx.response(request)
        } else {
            return Observable.error(NSError(domain: "RxHttp", code: 1, userInfo: nil))
        }
    }
    
}
