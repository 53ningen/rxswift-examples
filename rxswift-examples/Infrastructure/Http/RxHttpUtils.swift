import Foundation

internal struct RxHttpUtils {
    
    internal static func createRequest(method: HttpMethod, url: NSURL, params: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: NSTimeInterval) -> NSURLRequest? {
        let components = NSURLComponents(URL: url, resolvingAgainstBaseURL: false)
        components?.queryItems = params?.map{ NSURLQueryItem(name: $0.key, value: $0.value) }
        let request = components?.URL
            .map { NSMutableURLRequest(URL: $0) }
            .map { setHeaders(headers, mutableRequest: $0) }
        request?.HTTPMethod = method.rawValue
        request?.timeoutInterval = timeoutSec
        return request
    }
    
    private static func setHeaders(headers: [RequestHeader]?, mutableRequest: NSMutableURLRequest) -> NSMutableURLRequest {
        for (key, value) in toDictionary(headers ?? []) {
            mutableRequest.setValue(value, forHTTPHeaderField: key)
        }
        return mutableRequest
    }
    
    private static func toDictionary(requestHeaders: [RequestHeader]) -> [String : String] {
        var dict: [String : String] = [:]
        for header in requestHeaders {
            dict[header.key] = header.value
        }
        return dict
    }
    
}
