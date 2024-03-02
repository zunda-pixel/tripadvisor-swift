import Tagged

public struct Location: Codable, Identifiable {
  public var id: Tagged<Location, String>
  public var name: String
  public var address: Address

  private enum CodingKeys: String, CodingKey {
    case id = "location_id"
    case name
    case address = "address_obj"
  }
}
