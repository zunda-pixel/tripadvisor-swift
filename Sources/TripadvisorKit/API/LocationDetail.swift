import Currency
@preconcurrency import Foundation

extension TripadvisorAPI {
  /// A Location Details request returns comprehensive information about a location (hotel, restaurant, or an attraction) such as name, address, rating, and URLs for the listing on Tripadvisor.
  /// https://tripadvisor-content-api.readme.io/reference/getlocationdetails
  /// - Parameters:
  ///   - locationId: A unique identifier for a location on Tripadvisor. The location ID can be obtained using the Location Search.
  ///   - currency: The currency code to use for request and response (should follow ISO 4217).
  /// - Returns: ``Location``
  public func locationDetail(
    id locationId: Location.ID,
    currency: Currency? = nil
  ) async throws -> Location {
    let request = LocationDetailRequest(
      apiKey: apiKey,
      locationId: locationId,
      referer: referer,
      origin: origin,
      language: language,
      currency: currency
    )

    let (data, _) = try await session.data(for: request)

    let location = try JSONDecoder.tripadvisor.decode(Location.self, from: data)

    return location
  }
}
