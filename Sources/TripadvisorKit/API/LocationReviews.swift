import Foundation

extension TripadvisorAPI {
  public func locationReviews(
    locationId: Location.ID,
    address: String? = nil,
    limit: Int? = nil,
    offset: Int? = nil
  ) async throws -> [Review] {
    let request = LocationReviewsRequest(
      apiKey: apiKey,
      locationId: locationId,
      referer: referer,
      origin: origin,
      language: language,
      limit: limit,
      offset: offset
    )

    let (data, _) = try await session.data(for: request)
    
    let response = try JSONDecoder.tripadvisor.decode(ReviewsResponse.self, from: data)

    return response.reviews
  }
}
