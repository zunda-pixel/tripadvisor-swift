import Foundation
import Tagged

public struct Review: Codable, Identifiable {
  public var id: Tagged<Review, Int>
  public var lang: Language
  public var locationId: Int  //TODO Location.ID
  public var publishedDate: Date
  public var rating: Int
  public var helpfulVotes: Int
  public var ratingImageUrl: URL
  public var url: URL
  public var text: String
  public var title: String
  public var tripType: String
  public var travelDate: Date
  public var user: User

  private enum CodingKeys: String, CodingKey {
    case id
    case lang
    case locationId = "location_id"
    case publishedDate = "published_date"
    case rating
    case helpfulVotes = "helpful_votes"
    case ratingImageUrl = "rating_image_url"
    case url
    case text
    case title
    case tripType = "trip_type"
    case travelDate = "travel_date"
    case user
  }
}
