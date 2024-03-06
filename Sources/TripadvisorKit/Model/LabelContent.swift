public struct LabelContent: Codable, Sendable, Hashable {
  public var name: String
  public var localizedName: String
  public var value: String?

  private enum CodingKeys: String, CodingKey {
    case name
    case localizedName = "localized_name"
    case value
  }
}
