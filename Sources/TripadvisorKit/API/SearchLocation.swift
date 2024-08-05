import Foundation

extension TripadvisorAPI {
  /// Search Locations
  /// The Location Search request returns up to 10 locations found by the given search query.
  /// https://tripadvisor-content-api.readme.io/reference/searchforlocations
  /// - Parameters:
  ///   - query: Text to use for searching based on the name of the location
  ///   - category: Filters result set based on property type.
  ///   - phoneNumber: Phone number to filter the search results by (this can be in any format with spaces and dashes but without the "+" sign at the beginning)
  ///   - address: Address to filter the search results by
  ///   - point: Latitude/Longitude pair to scope down the search around a specifc point - eg. "42.3455,-71.10767"
  ///   - radius: Length of the radius from the provided latitude/longitude pair to filter results.
  /// - Returns: [``Location``]
  public func searchLocations(
    query: String,
    category: Category? = nil,
    phoneNumber: String? = nil,
    address: String? = nil,
    point: Location.Point? = nil,
    radius: Radius? = nil
  ) async throws -> [Location] {
    let request = SearchLocationsRequest(
      apiKey: apiKey,
      searchQuery: query,
      referer: referer,
      origin: origin,
      category: category,
      phoneNumber: phoneNumber,
      address: address,
      point: point,
      radius: radius,
      language: language
    )

    let (data, _) = try await httpClient.execute(for: request)

    let response = try JSONDecoder.tripadvisor.decode(LocationsResponse.self, from: data)

    return response.locations
  }
}
