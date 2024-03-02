extension Location {
  public struct Point: Codable {
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
