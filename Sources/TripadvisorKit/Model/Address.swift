public struct Address: Codable, Sendable, Hashable {
  public var street1: String
  public var street2: String
  public var city: String
  public var state: String?
  public var country: String
  public var postalCode: String?
  public var addressString: String

  private enum CodingKeys: String, CodingKey {
    case street1
    case street2
    case city
    case state
    case country
    case postalCode = "postalcode"
    case addressString = "address_string"
  }
}
