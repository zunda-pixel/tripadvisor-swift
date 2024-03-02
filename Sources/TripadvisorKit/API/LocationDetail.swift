import Foundation
import Currency

extension TripadvisorAPI {
  public func locationDetail(
    locationId: Location.ID,
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
    
    let location = try JSONDecoder().decode(Location.self, from: data)

    return location
  }
}
