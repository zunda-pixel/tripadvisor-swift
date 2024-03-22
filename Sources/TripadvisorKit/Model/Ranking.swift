public struct Ranking: Codable, Sendable, Hashable {
  public var geoLocationId: Location.ID
  public var rankingString: String
  public var geoLocationName: String
  public var rankingOutOf: Int
  public var ranking: Int

  private enum CodingKeys: String, CodingKey {
    case geoLocationId = "geo_location_id"
    case rankingString = "ranking_string"
    case geoLocationName = "geo_location_name"
    case rankingOutOf = "ranking_out_of"
    case ranking
  }

  public init(
    geoLocationId: Location.ID,
    rankingString: String,
    geoLocationName: String,
    rankingOutOf: Int,
    ranking: Int
  ) {
    self.geoLocationId = geoLocationId
    self.rankingString = rankingString
    self.geoLocationName = geoLocationName
    self.rankingOutOf = rankingOutOf
    self.ranking = ranking
  }

  public init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let geoLocationId = try container.decode(String.self, forKey: .geoLocationId)
    self.geoLocationId = .init(rawValue: Int(geoLocationId)!)
    self.rankingString = try container.decode(String.self, forKey: .rankingString)
    self.geoLocationName = try container.decode(String.self, forKey: .geoLocationName)
    let rankingOutOf = try container.decode(String.self, forKey: .rankingOutOf)
    self.rankingOutOf = Int(rankingOutOf)!
    let ranking = try container.decode(String.self, forKey: .ranking)
    self.ranking = Int(ranking)!
  }
}
