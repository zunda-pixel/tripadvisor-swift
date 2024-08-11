import Foundation
import HTTPClient

#if canImport(FoundationNetworking)
  @preconcurrency import FoundationNetworking
#endif

public struct TripadvisorAPI<HTTPClient: HTTPClientProtocol>: Sendable, Hashable where HTTPClient.Data == Foundation.Data, HTTPClient.Body == Foundation.Data, HTTPClient: Hashable {
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
