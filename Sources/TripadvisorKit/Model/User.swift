import Tagged

public struct User: Codable, Sendable, Hashable {
  public var name: String
  public var location: Location?
  public var avatar: Image?

  private enum CodingKeys: String, CodingKey {
    case name = "username"
    case location = "user_location"
    case avatar
  }
}

extension User {
  public struct Location: Codable, Sendable, Hashable {
    public var id: Tagged<Location, String>?
    public var name: String?
  }
}
