import Foundation
import HTTPTypes

public struct SearchNearLocationsRequest: Request {
  public var apiKey: String
  public var baseURL: URL = Constants.baseURL
  public var path: String = "\(Constants.apiVersionPath)/location/nearby_search"
  public var method: HTTPRequest.Method = .get
  public var point: Location.Point
  public var referer: URL?
  public var origin: URL?
  public var category: Category?
  public var phoneNumber: String?
  public var address: String?
  public var radius: Radius?
  public var language: Language?

  public var queries: [URLQueryItem] {
    var queries: [URLQueryItem] = [
      .init(name: "key", value: apiKey),
      .init(name: "latLong", value: "\(point.latitude),\(point.longitude)"),
    ]

    category.map { queries.append(.init(name: "category", value: $0.rawValue)) }
    phoneNumber.map { queries.append(.init(name: "phone", value: $0)) }
    address.map { queries.append(.init(name: "address", value: $0)) }
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
    point: Location.Point,
    referer: URL? = nil,
    origin: URL? = nil,
    category: Category? = nil,
    phoneNumber: String? = nil,
    address: String? = nil,
    radius: Radius? = nil,
    language: Language? = .en
  ) {
    self.apiKey = apiKey
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
