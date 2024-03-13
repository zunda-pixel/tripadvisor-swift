import Foundation
import Tagged

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct Location: Codable, Identifiable, Sendable, Hashable {
  public var id: Tagged<Location, String>
  public var name: String
  public var description: String?
  public var webURL: URL?
  public var address: Address?
  public var ancestors: [Ancestor]?
  public var latitude: String?
  public var longitude: String?
  public var timezone: String?
  public var phoneNumber: String?
  public var website: URL?
  public var writeReview: URL?
  public var ranking: Ranking?
  public var rating: String?
  public var ratingImageUrl: URL?
  public var reviewCount: String?
  public var reviewRatingCount: [String: String]?
  public var photoCount: String?
  public var seeAllPhotosURL: URL?
  public var priceLevel: String?
  public var hours: Hours?
  public var features: [String]?
  public var cuisines: [LabelContent]?
  public var category: LabelContent?
  public var subCategories: [LabelContent]?
  public var neighborhoods: [Location]?
  public var tripTypes: [LabelContent]?

  private enum CodingKeys: String, CodingKey {
    case id = "location_id"
    case name
    case description
    case webURL = "web_url"
    case address = "address_obj"
    case ancestors
    case latitude
    case longitude
    case timezone
    case phoneNumber = "phone"
    case website
    case writeReview = "write_review"
    case ranking = "ranking_data"
    case rating
    case ratingImageUrl = "rating_image_url"
    case reviewCount = "num_reviews"
    case reviewRatingCount = "review_rating_count"
    case photoCount = "photo_count"
    case seeAllPhotosURL = "see_all_photos"
    case priceLevel = "price_level"
    case hours
    case features
    case cuisines = "cuisine"
    case category
    case subCategories = "subcategory"
    case neighborhoods = "neighborhood_info"
    case tripTypes = "trip_types"
  }

  public init(
    id: Tagged<Location, String>,
    name: String,
    description: String? = nil,
    webURL: URL? = nil,
    address: Address? = nil,
    ancestors: [Ancestor]? = nil,
    latitude: String? = nil,
    longitude: String? = nil,
    timezone: String? = nil,
    phoneNumber: String? = nil,
    website: URL? = nil,
    writeReview: URL? = nil,
    ranking: Ranking? = nil,
    rating: String? = nil,
    ratingImageUrl: URL? = nil,
    reviewCount: String? = nil,
    reviewRatingCount: [String: String]? = nil,
    photoCount: String? = nil,
    seeAllPhotosURL: URL? = nil,
    priceLevel: String? = nil,
    hours: Hours? = nil,
    features: [String]? = nil,
    cuisines: [LabelContent]? = nil,
    category: LabelContent? = nil,
    subCategories: [LabelContent]? = nil,
    neighborhoods: [Location]? = nil,
    tripTypes: [LabelContent]? = nil
  ) {
    self.id = id
    self.name = name
    self.description = description
    self.webURL = webURL
    self.address = address
    self.ancestors = ancestors
    self.latitude = latitude
    self.longitude = longitude
    self.timezone = timezone
    self.phoneNumber = phoneNumber
    self.website = website
    self.writeReview = writeReview
    self.ranking = ranking
    self.rating = rating
    self.ratingImageUrl = ratingImageUrl
    self.reviewCount = reviewCount
    self.reviewRatingCount = reviewRatingCount
    self.photoCount = photoCount
    self.seeAllPhotosURL = seeAllPhotosURL
    self.priceLevel = priceLevel
    self.hours = hours
    self.features = features
    self.cuisines = cuisines
    self.category = category
    self.subCategories = subCategories
    self.neighborhoods = neighborhoods
    self.tripTypes = tripTypes
  }
}
