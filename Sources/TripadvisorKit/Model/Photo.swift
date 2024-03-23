#if os(Linux)
  @preconcurrency import Foundation
#else
  import Foundation
#endif

public struct Photo: Codable, Sendable, Hashable {
  public var id: Int
  public var isBlessed: Bool
  public var caption: String
  public var publishedDate: Date
  public var image: ImageContent
  public var album: String
  public var source: LabelContent
  public var user: User

  private enum CodingKeys: String, CodingKey {
    case id
    case isBlessed = "is_blessed"
    case caption
    case publishedDate = "published_date"
    case image = "images"
    case album
    case source
    case user
  }

  public init(
    id: Int,
    isBlessed: Bool,
    caption: String,
    publishedDate: Date,
    image: ImageContent,
    album: String,
    source: LabelContent,
    user: User
  ) {
    self.id = id
    self.isBlessed = isBlessed
    self.caption = caption
    self.publishedDate = publishedDate
    self.image = image
    self.album = album
    self.source = source
    self.user = user
  }
}
