public struct Radius {
  public var value: Double
  public var unit: Unit

  public enum Unit: String {
    case km
    case mi
    case m
  }
}
