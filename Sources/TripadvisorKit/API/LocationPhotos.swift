import Foundation

extension TripadvisorAPI {
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
