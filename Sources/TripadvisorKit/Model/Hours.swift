public struct Hours: Codable, Sendable, Hashable {
  public var periods: [Period]
  public var weekdayText: [String]

  private enum CodingKeys: String, CodingKey {
    case periods
    case weekdayText = "weekday_text"
  }

  public init(
    periods: [Period],
    weekdayText: [String]
  ) {
    self.periods = periods
    self.weekdayText = weekdayText
  }
}
