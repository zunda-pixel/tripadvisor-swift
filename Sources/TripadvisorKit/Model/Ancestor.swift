public struct Ancestor: Codable, Sendable, Hashable {
  public var level: String
  public var name: String
  public var locationId: Location.ID

  private enum CodingKeys: String, CodingKey {
    case level
    case name
    case locationId = "location_id"
  }

  public init(
    level: String,
    name: String,
    locationId: Location.ID
  ) {
    self.level = level
    self.name = name
    self.locationId = locationId
  }

  public init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.level = try container.decode(String.self, forKey: .level)
    self.name = try container.decode(String.self, forKey: .name)
    let locationId = try container.decode(String.self, forKey: .locationId)
    self.locationId = .init(Int(locationId)!)
  }
}
