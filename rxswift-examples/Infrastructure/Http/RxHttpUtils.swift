import Foundation

internal struct RxHttpUtils {
    
    internal static func createRequest(_ method: HttpMethod, url: URL, params: [RequestParameter]?, headers: [RequestHeader]?, timeoutSec: TimeInterval) -> URLRequest? {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = params?.map{ URLQueryItem(name: $0.key, value: $0.value) }
        let request = components?.url
            .map { NSMutableURLRequest(url: $0) }
            .map { setHeaders(headers, mutableRequest: $0) }
        request?.httpMethod = method.rawValue
        request?.timeoutInterval = timeoutSec
        return request as URLRequest?
    }
    
    private static func setHeaders(_ headers: [RequestHeader]?, mutableRequest: NSMutableURLRequest) -> NSMutableURLRequest {
        for (key, value) in toDictionary(headers ?? []) {
            mutableRequest.setValue(value, forHTTPHeaderField: key)
        }
        return mutableRequest
    }
    
    private static func toDictionary(_ requestHeaders: [RequestHeader]) -> [String : String] {
        var dict: [String : String] = [:]
        for header in requestHeaders {
            dict[header.key] = header.value
        }
        return dict
    }
    
}
