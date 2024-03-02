import Tagged

public struct User {
  public var name: String
  public var location: Location
  public var avator: Image
}

extension User {
  public struct Location: Codable {
    public var id: Tagged<Location, String>
    public var name: String
  }
}
