extension Location {
  public struct Point: Codable, Sendable, Hashable {
    public var latitude: Double
    public var longitude: Double

    public init(
      latitude: Double,
      longitude: Double
    ) {
      self.latitude = latitude
      self.longitude = longitude
    }
  }
}
