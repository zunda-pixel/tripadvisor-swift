import Foundation
import HTTPTypes
import Currency

public struct LocationDetailRequest: Request {
  public var apiKey: String
  public var baseURL: URL = Constants.baseURL
  public var locationId: Location.ID
  public var path: String { "\(Constants.apiVersionPath)/location/\(locationId)/details" }
  public var method: HTTPRequest.Method = .get
  public var referer: URL?
  public var origin: URL?
  public var language: Language?
  public var currency: Currency?

  public var queries: [URLQueryItem] {
    var queries: [URLQueryItem] = [
      .init(name: "key", value: apiKey),
    ]

    language.map { queries.append(.init(name: "language", value: $0.rawValue)) }
    currency.map { queries.append(.init(name: "currency", value: $0.rawValue)) }

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
    currency: Currency? = nil
  ) {
    self.apiKey = apiKey
    self.locationId = locationId
    self.referer = referer
    self.origin = origin
    self.language = language
    self.currency = currency
  }
}
