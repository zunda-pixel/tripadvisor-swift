#if os(Linux)
  @preconcurrency import Foundation
#else
  import Foundation
#endif

extension JSONDecoder {
  static public var tripadvisor: JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .custom { decoder in
      let string = try decoder.singleValueContainer().decode(String.self)
      if let date = try? Date(string, strategy: .iso8601) {
        return date
      } else {
        if let date = try? Date(string, strategy: .iso8601.year().month().day().time(includingFractionalSeconds: true)) {
          return date
        } else {
          if let data = try? Date(string, strategy: .iso8601.year().month().day()) {
            return data
          } else {
            throw DecodingError.dataCorrupted(
              .init(
                codingPath: decoder.codingPath,
                debugDescription: "\(string) doesn't match any of the supported formats."
              )
            )
          }
        }
      }
    }
    return decoder
  }
}
