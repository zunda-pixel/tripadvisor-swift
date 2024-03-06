public struct Ancestor: Codable, Sendable, Hashable {
  public var level: String
  public var name: String
  public var locationId: String

  private enum CodingKeys: String, CodingKey {
    case level
    case name
    case locationId = "location_id"
  }
  
  public init(
    level: String,
    name: String,
    locationId: String
  ) {
    self.level = level
    self.name = name
    self.locationId = locationId
  }
}
