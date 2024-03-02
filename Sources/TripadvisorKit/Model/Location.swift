public struct Location: Codable {
  public var id: String
  public var name: String
  public var address: Address

  private enum CodingKeys: String, CodingKey {
    case id = "location_id"
    case name
    case address = "address_obj"
  }
}
