public struct Ranking: Codable, Sendable, Hashable {
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
  
  public init(
    geoLocationId: String,
    rankingString: String,
    geoLocationName: String,
    rankingOutOf: String,
    ranking: String
  ) {
    self.geoLocationId = geoLocationId
    self.rankingString = rankingString
    self.geoLocationName = geoLocationName
    self.rankingOutOf = rankingOutOf
    self.ranking = ranking
  }
}
