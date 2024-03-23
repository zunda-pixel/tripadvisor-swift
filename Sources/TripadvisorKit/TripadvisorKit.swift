@preconcurrency import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct TripadvisorAPI: Sendable, Hashable {
  public var apiKey: String
  public var language: Language
  public var session: URLSession
  public var referer: URL?
  public var origin: URL?

  public init(
    apiKey: String,
    language: Language = .english,
    session: URLSession = .shared,
    referer: URL? = nil,
    origin: URL? = nil
  ) {
    self.apiKey = apiKey
    self.referer = referer
    self.origin = origin
    self.language = language
    self.session = session
  }
}
