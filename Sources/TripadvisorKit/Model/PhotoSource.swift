public struct PhotoSource: Codable {
  public var name: String
  public var localizedName: String
  
  private enum CodingKeys: String, CodingKey {
    case name
    case localizedName = "localized_name"
  }
}
