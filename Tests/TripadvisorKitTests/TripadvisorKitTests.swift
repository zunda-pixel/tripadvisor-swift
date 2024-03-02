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
    let locations = try await api.searchLocations(query: query)
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

  func testSearchNearLocation() async throws {
    let point = Location.Point(latitude: 35.652832, longitude: 139.839478)
    let locations = try await api.searchNearLocations(point: point)
    let location = locations.first!
    XCTAssertEqual(location.id, "14746542")
    XCTAssertEqual(location.name, "ビアンモール")
    XCTAssertEqual(location.address.street1, "臨海町1-4-2")
    XCTAssertEqual(location.address.street2, "東京臨海病院")
    XCTAssertEqual(location.address.city, "江戸川区")
    XCTAssertEqual(location.address.state, "東京都")
    XCTAssertEqual(location.address.country, "日本")
    XCTAssertEqual(location.address.postalCode, "〒134-0086")
    XCTAssertEqual(location.address.addressString, "〒134-0086 東京都 江戸川区 臨海町1-4-2 東京臨海病院")
  }

  func testLocationReviews() async throws {
    let locationId: Location.ID = "15654717"
    let reviews = try await api.locationReviews(locationId: locationId)
    XCTAssertTrue(reviews.map(\.locationId).allSatisfy { $0 == Int(locationId.rawValue)! })
  }
  
  func testLocationPhotos() async throws {
    let locationId: Location.ID = "15654717"
    let photos = try await api.locationPhotos(locationId: locationId)
    print(photos)
  }
}
