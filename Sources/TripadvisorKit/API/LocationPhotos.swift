import Foundation

extension TripadvisorAPI {
  /// The Location Photos request returns up to 5 high-quality photos for a specific location. Please note that the limits are different for the beta subscribers. You need to upgrade to get the higher limits mentioned here.
  /// https://tripadvisor-content-api.readme.io/reference/getlocationphotos
  /// - Parameters:
  ///   - locationId: A unique identifier for a location on Tripadvisor. The location ID can be obtained using the Location Search.
  ///   - limit: The number of results to return
  ///   - offset: The index of the first result
  ///   - source: A comma-separated list of allowed photo sources.
  /// - Returns: [``Photo``]
  public func locationPhotos(
    id locationId: Location.ID,
    limit: Int? = nil,
    offset: Int? = nil,
    source: PhotoSourceFilter? = nil
  ) async throws -> [Photo] {
    let request = LocationPhotosRequest(
      apiKey: apiKey,
      locationId: locationId,
      referer: referer,
      origin: origin,
      language: language,
      limit: limit,
      offset: offset,
      source: source
    )

    let (data, _) = try await session.data(for: request)

    let response = try JSONDecoder.tripadvisor.decode(PhotosResponse.self, from: data)

    return response.photos
  }
}
