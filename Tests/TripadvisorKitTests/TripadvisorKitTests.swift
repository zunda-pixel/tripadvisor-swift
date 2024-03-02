import XCTest

@testable import TripadvisorKit

final class TripadvisorKitTests: XCTestCase {
  let api = TripadvisorAPI(
    apiKey: ProcessInfo.processInfo.environment["API_KEY"]!,
    language: .ja,
    referer: URL(string: ProcessInfo.processInfo.environment["REFERER_URL"]!)!
  )

  func testSearchLocation() async throws {
    let query = "海老丸らーめん"
    let locations = try await api.searchLocation(query: query)
    let location = locations.first!
    XCTAssertEqual(location.id, "15654717")
    XCTAssertEqual(location.name, "海老丸 らーめん")
    XCTAssertEqual(location.address.street1, "西神田2-1-13")
    XCTAssertEqual(location.address.street2, "十勝ビル1F")
    XCTAssertEqual(location.address.city, "千代田区")
    XCTAssertEqual(location.address.state, "東京都")
    XCTAssertEqual(location.address.country, "日本")
    XCTAssertEqual(location.address.postalCode, "〒101-0065")
    XCTAssertEqual(location.address.addressString, "〒101-0065 東京都 千代田区 西神田2-1-13 十勝ビル1F")
  }
}
