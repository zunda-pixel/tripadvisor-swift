@preconcurrency import Foundation

extension TripadvisorAPI {
  /// Search Near Locations
  /// The Nearby Location Search request returns up to 10 locations found near the given latitude/longtitude.
  /// https://tripadvisor-content-api.readme.io/reference/searchfornearbylocations
  /// - Parameters:
  ///   - point: Latitude/Longitude pair to scope down the search around a specifc point - eg. "42.3455,-71.10767"
  ///   - category: Filters result set based on property type.
  ///   - phoneNumber: Phone number to filter the search results by (this can be in any format with spaces and dashes but without the "+" sign at the beginning)
  ///   - address: Address to filter the search results by
  ///   - radius: Length of the radius from the provided latitude/longitude pair to filter results.
  /// - Returns: [``Location``]
  public func searchNearLocations(
    point: Location.Point,
    category: Category? = nil,
    phoneNumber: String? = nil,
    address: String? = nil,
    radius: Radius? = nil
  ) async throws -> [Location] {
    let request = SearchNearLocationsRequest(
      apiKey: apiKey,
      point: point,
      referer: referer,
      origin: origin,
      category: category,
      phoneNumber: phoneNumber,
      address: address,
      radius: radius,
      language: language
    )

    let (data, _) = try await session.data(for: request)

    let response = try JSONDecoder.tripadvisor.decode(LocationsResponse.self, from: data)

    return response.locations
  }
}
