#if os(Linux)
  @preconcurrency import Foundation
#else
  import Foundation
#endif

public enum Constants: Sendable, Hashable {
  public static let baseURL = URL(string: "https://api.content.tripadvisor.com")!
  public static let apiVersionPath = "/api/v1"
}
