public struct Ancestor: Codable {
  public var level: String
  public var name: String
  public var locationId: String

  private enum CodingKeys: String, CodingKey {
    case level
    case name
    case locationId = "location_id"
  }
}
