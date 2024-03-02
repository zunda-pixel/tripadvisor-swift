import Foundation

extension TripadvisorAPI {
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

    let (data, _) = try await session.data(for: request)

    let response = try JSONDecoder().decode(LocationsResponse.self, from: data)

    return response.locations
  }
}
