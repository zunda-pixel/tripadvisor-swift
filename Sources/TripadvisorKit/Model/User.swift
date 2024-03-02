import Tagged

public struct User: Codable {
  public var name: String
  public var location: Location
  public var avatar: Image

  private enum CodingKeys: String, CodingKey {
    case name = "username"
    case location = "user_location"
    case avatar
  }
}

extension User {
  public struct Location: Codable {
    public var id: Tagged<Location, String>?
    public var name: String?
  }
}
