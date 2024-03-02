public struct PhotosResponse: Codable {
  public var photos: [Photo]
  
  private enum CodingKeys: String, CodingKey {
    case photos = "data"
  }
}
