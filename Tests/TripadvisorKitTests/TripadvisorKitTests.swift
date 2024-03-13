import XCTest

@testable import TripadvisorKit

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

final class TripadvisorKitTests: XCTestCase {
  let api = TripadvisorAPI(
    apiKey: ProcessInfo.processInfo.environment["API_KEY"]!,
    language: .english,
    referer: URL(string: ProcessInfo.processInfo.environment["REFERER_URL"]!)!
  )

  func testSearchLocation() async throws {
    let query = "Apple Park Visitor Center"
    let locations = try await api.searchLocations(query: query)
    let location = locations.first!
    XCTAssertEqual(location.id, "13331376")
    XCTAssertEqual(location.name, "Apple Park Visitor Center")
    XCTAssertEqual(location.address?.street1, "10600 N Tantau Ave")
    XCTAssertNil(location.address?.street2)
    XCTAssertEqual(location.address?.city, "Cupertino")
    XCTAssertEqual(location.address?.state, "California")
    XCTAssertEqual(location.address?.country, "United States")
    XCTAssertEqual(location.address?.postalCode, "95014-0739")
    XCTAssertEqual(location.address?.addressString, "10600 N Tantau Ave, Cupertino, CA 95014-0739")
  }

  func testSearchNearLocation() async throws {
    let point = Location.Point(latitude: 37.334603, longitude: -122.009198)
    let locations = try await api.searchNearLocations(point: point)
    let location = locations.first!
    XCTAssertEqual(location.id, "13331376")
    XCTAssertEqual(location.name, "Apple Park Visitor Center")
    XCTAssertEqual(location.address?.street1, "10600 N Tantau Ave")
    XCTAssertNil(location.address?.street2)
    XCTAssertEqual(location.address?.city, "Cupertino")
    XCTAssertEqual(location.address?.state, "California")
    XCTAssertEqual(location.address?.country, "United States")
    XCTAssertEqual(location.address?.postalCode, "95014-0739")
    XCTAssertEqual(location.address?.addressString, "10600 N Tantau Ave, Cupertino, CA 95014-0739")
  }

  func testLocationReviews() async throws {
    let locationId: Location.ID = "13331376"
    let reviews = try await api.locationReviews(id: locationId)
    XCTAssertTrue(reviews.map(\.locationId).allSatisfy { $0 == Int(locationId.rawValue)! })
  }

  func testLocationPhotos() async throws {
    let locationId: Location.ID = "13331376"
    let photos = try await api.locationPhotos(id: locationId)
    print(photos)
  }

  func testLocatioDetail() async throws {
    let locationId: Location.ID = "13331376"
    let location = try await api.locationDetail(id: locationId)
    print(location)
    XCTAssertEqual(location.id, locationId)
    XCTAssertEqual(location.name, "Apple Park Visitor Center")
    XCTAssertEqual(location.address?.street1, "10600 N Tantau Ave")
    XCTAssertNil(location.address?.street2)
    XCTAssertEqual(location.address?.city, "Cupertino")
    XCTAssertEqual(location.address?.state, "California")
    XCTAssertEqual(location.address?.country, "United States")
    XCTAssertEqual(location.address?.postalCode, "95014-0739")
    XCTAssertEqual(location.address?.addressString, "10600 N Tantau Ave, Cupertino, CA 95014-0739")
    XCTAssertEqual(
      location.description,
      "Step into the heart of the Apple empire at this sleek and modern building—the only part of the Apple Park campus that’s open to the public. Here, you can tour the innovative exhibition space for a behind-the-scenes look at Apple’s journey, technology, and design principles, head up to the roof terrace for an expansive view of Apple Park, and rub shoulders with other creatives at the cafe. Of course, the highlight of the center is the massive Apple Store where you can browse their full range of products and snag exclusive merchandise. You can check out the center and other tech giants on a tour of Silicon Valley. – Tripadvisor"
    )
    XCTAssertEqual(
      location.webURL,
      URL(
        string:
          "https://www.tripadvisor.com/Attraction_Review-g32273-d13331376-Reviews-Apple_Park_Visitor_Center-Cupertino_California.html?m=66827"
      )!)
    XCTAssertEqual(
      location.ancestors,
      [
        .init(level: "City", name: "Cupertino", locationId: "32273"),
        .init(level: "State", name: "California", locationId: "28926"),
        .init(level: "Country", name: "United States", locationId: "191"),
      ])
    XCTAssertEqual(location.latitude, "37.33272")
    XCTAssertEqual(location.longitude, "-122.00533")
    XCTAssertEqual(location.timezone, "America/Los_Angeles")
    XCTAssertEqual(location.phoneNumber, "+1 408-961-1560")
    XCTAssertEqual(
      location.website, URL(string: "http://www.apple.com/retail/appleparkvisitorcenter/")!)
    XCTAssertEqual(
      location.writeReview,
      URL(
        string:
          "https://www.tripadvisor.com/UserReview-g32273-d13331376-Apple_Park_Visitor_Center-Cupertino_California.html?m=66827"
      )!)
    XCTAssertEqual(
      location.ranking,
      .init(
        geoLocationId: "32273", rankingString: "#3 of 30 things to do in Cupertino",
        geoLocationName: "Cupertino", rankingOutOf: "30", ranking: "3"))
    XCTAssertEqual(location.rating, "4.0")
    XCTAssertEqual(
      location.ratingImageUrl,
      URL(string: "https://www.tripadvisor.com/img/cdsi/img2/ratings/traveler/4.0-66827-5.svg")!)
    XCTAssertEqual(
      location.reviewRatingCount, ["2": "13", "5": "107", "4": "59", "3": "52", "1": "8"])
    XCTAssertEqual(location.photoCount, "424")
    XCTAssertEqual(
      location.seeAllPhotosURL,
      URL(
        string:
          "https://www.tripadvisor.com/Attraction_Review-g32273-d13331376-m66827-Reviews-Apple_Park_Visitor_Center-Cupertino_California.html#photos"
      )!)
    XCTAssertEqual(location.priceLevel, nil)
    XCTAssertEqual(location.hours, nil)
    XCTAssertEqual(location.features, nil)
    XCTAssertEqual(location.cuisines, nil)
    XCTAssertEqual(
      location.category, .init(name: "attraction", localizedName: "Attraction", value: nil))
    XCTAssertEqual(
      location.subCategories,
      [
        .init(name: "landmarks", localizedName: "Sights & Landmarks", value: nil),
        .init(name: "attractions", localizedName: "Attractions", value: nil),
      ])
    XCTAssertEqual(location.neighborhoods, [])
    XCTAssertEqual(
      location.tripTypes,
      [
        .init(name: "business", localizedName: "Business", value: "18"),
        .init(name: "couples", localizedName: "Couples", value: "52"),
        .init(name: "solo", localizedName: "Solo travel", value: "35"),
        .init(name: "family", localizedName: "Family", value: "53"),
        .init(name: "friends", localizedName: "Friends getaway", value: "30"),
      ])
  }
}
