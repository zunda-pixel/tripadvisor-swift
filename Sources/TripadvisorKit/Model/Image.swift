import Foundation

public struct Image: Codable, Sendable, Hashable {
  public var thumbnail: URL
  public var small: URL
  public var medium: URL
  public var large: URL
}

public struct ImageResource: Codable, Sendable, Hashable {
  public var height: Double
  public var width: Int
  public var url: URL
}

public struct ImageContent: Codable, Sendable, Hashable {
  public var thumbnail: ImageResource
  public var small: ImageResource
  public var medium: ImageResource
  public var large: ImageResource
  public var original: ImageResource
}
