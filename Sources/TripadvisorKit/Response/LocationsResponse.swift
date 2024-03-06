public struct LocationsResponse: Codable, Sendable, Hashable {
  public var locations: [Location]

  private enum CodingKeys: String, CodingKey {
    case locations = "data"
  }
}
