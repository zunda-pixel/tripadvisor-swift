#if os(Linux)
@preconcurrency import Foundation
#else
import Foundation
#endif

import HTTPTypes

public struct SearchLocationsRequest: Request, Sendable, Hashable {
  public var apiKey: String
  public var baseURL: URL = Constants.baseURL
  public var path: String = "\(Constants.apiVersionPath)/location/search"
  public var method: HTTPRequest.Method = .get
  public var searchQuery: String
  public var referer: URL?
  public var origin: URL?
  public var category: Category?
  public var phoneNumber: String?
  public var address: String?
  public var point: Location.Point?
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
    point.map { queries.append(.init(name: "latLong", value: "\($0.latitude),\($0.longitude)")) }
    language.map { queries.append(.init(name: "language", value: $0.rawValue)) }

    return queries
  }

  public var headers: HTTPFields {
    var headers: HTTPFields = [
      .accept: "application/json"
    ]

    referer.map { headers[.referer] = $0.absoluteString }
    origin.map { headers[.origin] = $0.absoluteString }

    return headers
  }

  public init(
    apiKey: String,
    searchQuery: String,
    referer: URL? = nil,
    origin: URL? = nil,
    category: Category? = nil,
    phoneNumber: String? = nil,
    address: String? = nil,
    point: Location.Point? = nil,
    radius: Radius? = nil,
    language: Language? = .english
  ) {
    self.apiKey = apiKey
    self.searchQuery = searchQuery
    self.referer = referer
    self.origin = origin
    self.category = category
    self.phoneNumber = phoneNumber
    self.address = address
    self.point = point
    self.radius = radius
    self.language = language
  }
}
