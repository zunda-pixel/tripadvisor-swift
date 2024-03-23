@preconcurrency import Foundation

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
          return formatter.date(from: string)!
        }
      }
    }
    return decoder
  }
}
