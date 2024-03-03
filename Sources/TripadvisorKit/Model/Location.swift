import Tagged
import Foundation

public struct Location: Codable, Identifiable {
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
}

public struct Ranking: Codable {
  public var geoLocationId: String
  public var rankingString: String
  public var geoLocationName: String
  public var rankingOutOf: String
  public var ranking: String
  
  private enum CodingKeys: String, CodingKey {
    case geoLocationId = "geo_location_id"
    case rankingString = "ranking_string"
    case geoLocationName = "geo_location_name"
    case rankingOutOf = "ranking_out_of"
    case ranking
  }
}

public struct Period: Codable {
  public var open: Time
  public var close: Time
  
  public struct Time: Codable {
    public var day: Int
    public var time: String
  }
}

public struct Hours: Codable {
  public var periods: [Period]
  public var weekdayText: [String]
  
  private enum CodingKeys: String, CodingKey {
    case periods
    case weekdayText = "weekday_text"
  }
}
