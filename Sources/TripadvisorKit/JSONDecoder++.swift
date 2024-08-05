#if os(Linux)
  @preconcurrency import Foundation
#else
  import Foundation
#endif

extension JSONDecoder {
  static public var tripadvisor: JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .custom { decoder in
      let formatter = ISO8601DateFormatter()
      let string = try decoder.singleValueContainer().decode(String.self)
      if let date = formatter.date(from: string) {
        return date
      } else {
        formatter.formatOptions.insert(.withFractionalSeconds)
        if let date = formatter.date(from: string) {
          return date
        } else {
          let formatter = DateFormatter()
          formatter.dateStyle = .short
          formatter.timeStyle = .none
          if let data = formatter.date(from: string) {
            return data
          } else {
            throw DecodingError.dataCorrupted(.init(
              codingPath: [],
              debugDescription: "\(string) doesn't match any of the supported formats.")
            )
          }
        }
      }
    }
    return decoder
  }
}
