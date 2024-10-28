import HTTPClient
import HTTPTypes
import HTTPTypesFoundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
  @preconcurrency import Foundation
#else
  import Foundation
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
    var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
    components.queryItems = queries
    return components.url!
  }
}

extension HTTPClientProtocol {
  public func execute(for request: some Request) async throws -> (Data, HTTPResponse) {
    let request = HTTPRequest(
      method: request.method,
      url: request.url,
      headerFields: request.headers
    )

    return try await self.execute(
      for: request,
      from: nil
    )
  }
}
