public struct ReviewsResponse: Codable {
  public var reviews: [Review]
  
  private enum CodingKeys: String, CodingKey {
    case reviews = "data"
  }
}
