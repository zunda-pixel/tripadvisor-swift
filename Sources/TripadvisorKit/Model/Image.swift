import Foundation

public struct Image: Codable {
  public var thumbnail: URL
  public var small: URL
  public var medium: URL
  public var large: URL
}
