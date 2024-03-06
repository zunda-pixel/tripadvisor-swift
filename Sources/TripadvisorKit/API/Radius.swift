public struct Radius: Sendable, Hashable {
  public var value: Double
  public var unit: Unit

  public enum Unit: String, Sendable, Hashable, CaseIterable {
    case km
    case mi
    case m
  }
}
