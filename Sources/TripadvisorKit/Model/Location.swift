import Foundation
import Tagged

public struct Location: Codable, Identifiable, Sendable, Hashable {
  public var id: Tagged<Location, Int>
  public var name: String
  public var description: String?
  public var webURL: URL?
  public var address: Address?
  public var ancestors: [Ancestor]?
  public var latitude: Double?
  public var longitude: Double?
  public var timezone: String?
  public var phoneNumber: String?
  public var website: URL?
  public var writeReview: URL?
  public var ranking: Ranking?
  public var rating: Double?
  public var ratingImageUrl: URL?
  public var reviewCount: Int?
  public var reviewRatingCount: [Int: Int]?
  public var photoCount: Int?
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
    id: Tagged<Location, Int>,
    name: String,
    description: String? = nil,
    webURL: URL? = nil,
    address: Address? = nil,
    ancestors: [Ancestor]? = nil,
    latitude: Double? = nil,
    longitude: Double? = nil,
    timezone: String? = nil,
    phoneNumber: String? = nil,
    website: URL? = nil,
    writeReview: URL? = nil,
    ranking: Ranking? = nil,
    rating: Double? = nil,
    ratingImageUrl: URL? = nil,
    reviewCount: Int? = nil,
    reviewRatingCount: [Int: Int]? = nil,
    photoCount: Int? = nil,
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

  public init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    // TODO API should have Int but String.
    let id = try container.decode(String.self, forKey: .id)
    self.id = .init(Int(id)!)
    self.name = try container.decode(String.self, forKey: .name)
    self.description = try container.decodeIfPresent(String.self, forKey: .description)
    self.webURL = try container.decodeIfPresent(URL.self, forKey: .webURL)
    self.address = try container.decodeIfPresent(Address.self, forKey: .address)
    self.ancestors = try container.decodeIfPresent([Ancestor].self, forKey: .ancestors)

    // TODO API should have Double but String.
    let latitude = try container.decodeIfPresent(String.self, forKey: .latitude)
    self.latitude = latitude.map { Double($0)! }
    let longitude = try container.decodeIfPresent(String.self, forKey: .longitude)
    self.longitude = longitude.map { Double($0)! }

    self.timezone = try container.decodeIfPresent(String.self, forKey: .timezone)
    self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
    self.website = try container.decodeIfPresent(URL.self, forKey: .website)
    self.writeReview = try container.decodeIfPresent(URL.self, forKey: .writeReview)
    self.ranking = try container.decodeIfPresent(Ranking.self, forKey: .ranking)

    // TODO API should have Double but String.
    let rating = try container.decodeIfPresent(String.self, forKey: .rating)
    self.rating = rating.map { Double($0)! }

    self.ratingImageUrl = try container.decodeIfPresent(URL.self, forKey: .ratingImageUrl)

    // TODO API should have Int but String.
    let reviewCount = try container.decodeIfPresent(String.self, forKey: .reviewCount)
    self.reviewCount = reviewCount.map { Int($0)! }

    // TODO API should have [Int: Int] but [String: String].
    let reviewRatingCount = try container.decodeIfPresent(
      [String: String].self, forKey: .reviewRatingCount)
    let reviewRatingCountKeyValues = reviewRatingCount?.map { (Int($0.key)!, Int($0.value)!) }
    self.reviewRatingCount = reviewRatingCountKeyValues.map { .init(uniqueKeysWithValues: $0) }

    // TODO API should have Int but String.
    let photoCount = try container.decodeIfPresent(String.self, forKey: .photoCount)
    self.photoCount = photoCount.map { Int($0)! }

    self.seeAllPhotosURL = try container.decodeIfPresent(URL.self, forKey: .seeAllPhotosURL)
    self.priceLevel = try container.decodeIfPresent(String.self, forKey: .priceLevel)
    self.hours = try container.decodeIfPresent(Hours.self, forKey: .hours)
    self.features = try container.decodeIfPresent([String].self, forKey: .features)
    self.cuisines = try container.decodeIfPresent([LabelContent].self, forKey: .cuisines)
    self.category = try container.decodeIfPresent(LabelContent.self, forKey: .category)
    self.subCategories = try container.decodeIfPresent([LabelContent].self, forKey: .subCategories)
    self.neighborhoods = try container.decodeIfPresent([Location].self, forKey: .neighborhoods)
    self.tripTypes = try container.decodeIfPresent([LabelContent].self, forKey: .tripTypes)
  }
}
