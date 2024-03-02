public struct LocationsResponse: Codable {
  public var locations: [Location]

  private enum CodingKeys: String, CodingKey {
    case locations = "data"
  }
}
