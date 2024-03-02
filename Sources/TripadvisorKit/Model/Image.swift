import Foundation

public struct Image: Codable {
  public var thumbnail: URL
  public var small: URL
  public var medium: URL
  public var large: URL
}

public struct ImageResource: Codable {
  public var height: Double
  public var width: Int
  public var url: URL
}

public struct ImageContent: Codable {
  public var thumbnail: ImageResource
  public var small: ImageResource
  public var medium: ImageResource
  public var large: ImageResource
  public var original: ImageResource
}
