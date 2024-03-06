public struct Period: Codable, Sendable, Hashable {
  public var open: Time
  public var close: Time
  
  public init(
    open: Time,
    close: Time
  ) {
    self.open = open
    self.close = close
  }
}

extension Period {
  public struct Time: Codable, Sendable, Hashable {
    public var day: Int
    public var time: String
    
    public init(
      day: Int,
      time: String
    ) {
      self.day = day
      self.time = time
    }
  }
}
