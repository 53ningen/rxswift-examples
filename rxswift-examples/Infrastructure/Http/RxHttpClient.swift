import RxSwift
import Foundation

public typealias RequestParameter = (key: String, value: String)
public typealias RequestHeader = (key: String, value: String)

public protocol RxHttpClient {
    
    func get(_ url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval?) -> Observable<(Data, HTTPURLResponse)>
    
    func post(_ url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval?) -> Observable<(Data, HTTPURLResponse)>
    
    func put(_ url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval?) -> Observable<(Data, HTTPURLResponse)>
    
    func delete(_ url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval?) -> Observable<(Data, HTTPURLResponse)>
    
    func execute(_ method: HttpMethod, url: URL, parameters: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval?) -> Observable<(Data, HTTPURLResponse)>
    
}
