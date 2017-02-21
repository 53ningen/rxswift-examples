import RxSwift
import Foundation

public typealias RequestParameter = (key: String, value: String)
public typealias RequestHeader = (key: String, value: String)

public protocol RxHttpClient {
    
    func get(_ url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval?) -> Observable<(HTTPURLResponse, Data)>
    
    func post(_ url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval?) -> Observable<(HTTPURLResponse, Data)>
    
    func put(_ url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval?) -> Observable<(HTTPURLResponse, Data)>
    
    func delete(_ url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval?) -> Observable<(HTTPURLResponse, Data)>
    
    func execute(_ method: HttpMethod, url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval?) -> Observable<(HTTPURLResponse, Data)>
    
}
