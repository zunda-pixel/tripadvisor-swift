public struct ReviewsResponse: Codable, Sendable, Hashable {
  public var reviews: [Review]

  private enum CodingKeys: String, CodingKey {
    case reviews = "data"
  }
}
