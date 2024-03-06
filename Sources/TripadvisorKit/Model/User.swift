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
  
  public init(
    name: String,
    location: Location? = nil,
    avatar: Image? = nil
  ) {
    self.name = name
    self.location = location
    self.avatar = avatar
  }
}

extension User {
  public struct Location: Codable, Sendable, Hashable {
    public var id: Tagged<Location, String>?
    public var name: String?
    
    public init(
      id: Tagged<Location, String>? = nil,
      name: String? = nil
    ) {
      self.id = id
      self.name = name
    }
  }
}
