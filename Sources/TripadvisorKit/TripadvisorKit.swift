#if os(Linux)
  @preconcurrency import Foundation
#else
  import Foundation
#endif

#if canImport(FoundationNetworking)
  @preconcurrency import FoundationNetworking
#endif

import HTTPClient

public struct TripadvisorAPI<HTTPClient: HTTPClientProtocol>: Sendable, Hashable {
  public var apiKey: String
  public var language: Language
  public var httpClient: HTTPClient
  public var referer: URL?
  public var origin: URL?

  public init(
    apiKey: String,
    language: Language = .english,
    httpClient: HTTPClient,
    referer: URL? = nil,
    origin: URL? = nil
  ) {
    self.apiKey = apiKey
    self.referer = referer
    self.origin = origin
    self.language = language
    self.httpClient = httpClient
  }
}
