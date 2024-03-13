import Foundation
import Tagged

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct Review: Codable, Identifiable, Sendable, Hashable {
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

  public init(
    id: Tagged<Review, Int>,
    lang: Language,
    locationId: Int,
    publishedDate: Date,
    rating: Int,
    helpfulVotes: Int,
    ratingImageUrl: URL,
    url: URL,
    text: String,
    title: String,
    tripType: String,
    travelDate: Date,
    user: User
  ) {
    self.id = id
    self.lang = lang
    self.locationId = locationId
    self.publishedDate = publishedDate
    self.rating = rating
    self.helpfulVotes = helpfulVotes
    self.ratingImageUrl = ratingImageUrl
    self.url = url
    self.text = text
    self.title = title
    self.tripType = tripType
    self.travelDate = travelDate
    self.user = user
  }
}
