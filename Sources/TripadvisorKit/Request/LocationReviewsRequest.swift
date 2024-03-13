import Foundation
import HTTPTypes

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct LocationReviewsRequest: Request, Sendable, Hashable {
  public var apiKey: String
  public var baseURL: URL = Constants.baseURL
  public var path: String { "\(Constants.apiVersionPath)/location/\(locationId)/reviews" }
  public var method: HTTPRequest.Method = .get
  public var locationId: Location.ID
  public var referer: URL?
  public var origin: URL?
  public var language: Language?
  public var limit: Int?
  public var offset: Int?

  public var queries: [URLQueryItem] {
    var queries: [URLQueryItem] = [
      .init(name: "key", value: apiKey)
    ]

    language.map { queries.append(.init(name: "language", value: $0.rawValue)) }
    limit.map { queries.append(.init(name: "limit", value: $0.description)) }
    offset.map { queries.append(.init(name: "offset", value: $0.description)) }

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
    locationId: Location.ID,
    referer: URL? = nil,
    origin: URL? = nil,
    language: Language? = nil,
    limit: Int? = nil,
    offset: Int? = nil
  ) {
    self.apiKey = apiKey
    self.locationId = locationId
    self.referer = referer
    self.origin = origin
    self.language = language
    self.limit = limit
    self.offset = offset
  }
}
