import Foundation

public struct Image: Codable, Sendable, Hashable {
  public var thumbnail: URL
  public var small: URL
  public var medium: URL
  public var large: URL

  public init(
    thumbnail: URL,
    small: URL,
    medium: URL,
    large: URL
  ) {
    self.thumbnail = thumbnail
    self.small = small
    self.medium = medium
    self.large = large
  }
}

public struct ImageResource: Codable, Sendable, Hashable {
  public var height: Double
  public var width: Int
  public var url: URL

  public init(
    height: Double,
    width: Int,
    url: URL
  ) {
    self.height = height
    self.width = width
    self.url = url
  }
}

public struct ImageContent: Codable, Sendable, Hashable {
  public var thumbnail: ImageResource
  public var small: ImageResource
  public var medium: ImageResource
  public var large: ImageResource
  public var original: ImageResource?

  public init(
    thumbnail: ImageResource,
    small: ImageResource,
    medium: ImageResource,
    large: ImageResource,
    original: ImageResource? = nil
  ) {
    self.thumbnail = thumbnail
    self.small = small
    self.medium = medium
    self.large = large
    self.original = original
  }
}
