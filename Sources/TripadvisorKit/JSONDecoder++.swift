#if os(Linux)
  @preconcurrency import Foundation
#else
  import Foundation
#endif

extension JSONDecoder {
  static public var tripadvisor: JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .custom { decoder in
      let container = try decoder.singleValueContainer()
      let string = try container.decode(String.self)
      if let date = try? Date(string, strategy: .iso8601) {
        return date
      } else {
        if let date = try? Date(
          string,
          strategy: Date.ISO8601FormatStyle(includingFractionalSeconds: true)
        ) {
          return date
        } else {
          if let data = try? Date(string, strategy: .iso8601.year().month().day()) {
            return data
          } else {
            throw DecodingError.dataCorruptedError(
              in: container,
              debugDescription: "\(string) doesn't match any of the supported formats"
            )
          }
        }
      }
    }
    return decoder
  }
}
