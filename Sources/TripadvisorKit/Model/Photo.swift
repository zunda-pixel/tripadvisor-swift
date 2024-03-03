import Foundation

public struct Photo: Codable {
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
}
