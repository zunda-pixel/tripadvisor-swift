public struct PhotosResponse: Codable, Sendable, Hashable {
  public var photos: [Photo]

  private enum CodingKeys: String, CodingKey {
    case photos = "data"
  }
}
