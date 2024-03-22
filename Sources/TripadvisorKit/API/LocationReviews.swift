import Foundation

extension TripadvisorAPI {
  /// The Location Reviews request returns up to 5 of the most recent reviews for a specific location. Please note that the limits are different for the beta subscribers. You need to upgrade to get the higher limits mentioned here.
  /// https://tripadvisor-content-api.readme.io/reference/getlocationreviews
  /// - Parameters:
  ///   - locationId: A unique identifier for a location on Tripadvisor. The location ID can be obtained using the Location Search.
  ///   - limit: The number of results to return
  ///   - offset: The index of the first result
  /// - Returns: [``Review``]
  public func locationReviews(
    id locationId: Location.ID,
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
