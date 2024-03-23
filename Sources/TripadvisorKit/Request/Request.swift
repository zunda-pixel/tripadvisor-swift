@preconcurrency import Foundation
import HTTPTypes
import HTTPTypesFoundation

#if canImport(FoundationNetworking)
  import FoundationNetworking

  extension URLSession {
    public func data(for request: URLRequest) async throws -> (Data, URLResponse) {
      return try await withCheckedThrowingContinuation { continuation in
        self.dataTask(with: request) { data, response, error in
          if let error {
            continuation.resume(throwing: error)
          } else  {
            continuation.resume(returning: (data!, response!))
          }
        }
        .resume()
      }
    }
    public func data(for request: HTTPRequest, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, HTTPResponse) {
      guard let urlRequest = URLRequest(httpRequest: request) else {
        throw HTTPTypeConversionError.failedToConvertHTTPRequestToURLRequest
      }
      let (data, urlResponse) = try await self.data(for: urlRequest, delegate: delegate)
      guard let response = (urlResponse as? HTTPURLResponse)?.httpResponse else {
        throw HTTPTypeConversionError.failedToConvertURLResponseToHTTPResponse
      }
      return (data, response)
    }
  }
#endif

public protocol Request {
  var baseURL: URL { get }
  var path: String { get }
  var url: URL { get }
  var method: HTTPRequest.Method { get }
  var queries: [URLQueryItem] { get }
  var headers: HTTPFields { get }
}

extension Request {
  public var url: URL {
    let url = baseURL.appendingPathComponent(path)
    var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    components.queryItems = queries
    return components.url!
  }
}

extension URLSession {
  public func data(for request: some Request) async throws -> (Data, HTTPResponse) {
    let request = HTTPRequest(
      method: request.method,
      url: request.url,
      headerFields: request.headers
    )
    return try await self.data(for: request)
  }
}
