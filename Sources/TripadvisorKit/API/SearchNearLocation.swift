import Foundation

extension TripadvisorAPI {
  public func searchNearLocation(
    point: Location.Point,
    category: Category? = nil,
    phoneNumber: String? = nil,
    address: String? = nil,
    radius: Radius? = nil
  ) async throws -> [Location] {
    let request = SearchNearLocationRequest(
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

    let response = try JSONDecoder().decode(LocationsResponse.self, from: data)

    return response.locations
  }
}
