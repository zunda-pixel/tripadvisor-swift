@preconcurrency import Foundation

public enum Constants: Sendable, Hashable {
  public static let baseURL = URL(string: "https://api.content.tripadvisor.com")!
  public static let apiVersionPath = "/api/v1"
}
