import Foundation
import HTTPTypes

public struct LocationSearchRequest: Request {
  public var apiKey: String
  public var baseURL: URL = BASE_URL
  public var path: String = "\(API_VERSION_PATH)/location/search"
  public var method: HTTPRequest.Method = .get
  public var searchQuery: String
  public var referer: URL?
  public var origin: URL?
  public var category: Category?
  public var phoneNumber: String?
  public var address: String?
  public var point: CGPoint?
  public var radius: Radius?
  public var language: Language?

  public var queries: [URLQueryItem] {
    var queries: [URLQueryItem] = [
      .init(name: "key", value: apiKey),
      .init(name: "searchQuery", value: searchQuery),
    ]
    
    category.map { queries.append(.init(name: "category", value: $0.rawValue)) }
    phoneNumber.map { queries.append(.init(name: "phone", value: $0)) }
    address.map { queries.append(.init(name: "address", value: $0)) }
    point.map { queries.append(.init(name: "latLong", value: "\($0.x),\($0.y)")) }
    language.map { queries.append(.init(name: "language", value: $0.rawValue)) }
    
    return queries
  }
  
  public var headers: HTTPFields {
    var headers: HTTPFields = [
      .accept: "application/json",
    ]
    
    referer.map { headers[.referer] = $0.absoluteString }
    origin.map { headers[.origin] = $0.absoluteString }
    
    return headers
  }
}
