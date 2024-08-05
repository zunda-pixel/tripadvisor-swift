import Foundation
import Testing
import TripadvisorKit

let api = TripadvisorAPI(
  apiKey: ProcessInfo.processInfo.environment["API_KEY"]!,
  language: .english,
  httpClient: .urlSession(.shared),
  referer: URL(string: ProcessInfo.processInfo.environment["REFERER_URL"]!)!
)

@Test
func searchLocation() async throws {
  let query = "Apple Park Visitor Center"
  let locations = try await api.searchLocations(query: query)
  let location = locations.first!
  #expect(location.id == 13_331_376)
  #expect(location.name == "Apple Park Visitor Center")
  #expect(location.address?.street1 == "10600 N Tantau Ave")
  #expect(location.address?.street2 == nil)
  #expect(location.address?.city == "Cupertino")
  #expect(location.address?.state == "California")
  #expect(location.address?.country == "United States")
  #expect(location.address?.postalCode == "95014-0739")
  #expect(location.address?.addressString == "10600 N Tantau Ave, Cupertino, CA 95014-0739")
}

@Test
func searchNearLocation() async throws {
  let point = Location.Point(latitude: 37.3327799255124, longitude: -122.0053672856373)
  let locations = try await api.searchNearLocations(point: point)
  let location = locations.first!
  #expect(location.id == 13_331_376)
  #expect(location.name == "Apple Park Visitor Center")
  #expect(location.address?.street1 == "10600 N Tantau Ave")
  #expect(location.address?.street2 == nil)
  #expect(location.address?.city == "Cupertino")
  #expect(location.address?.state == "California")
  #expect(location.address?.country == "United States")
  #expect(location.address?.postalCode == "95014-0739")
  #expect(location.address?.addressString == "10600 N Tantau Ave, Cupertino, CA 95014-0739")
}

@Test
func locationReviews() async throws {
  let locationId: Location.ID = 13_331_376
  let reviews = try await api.locationReviews(id: locationId)
  #expect(reviews.map(\.locationId).allSatisfy { $0 == locationId } == true)
}

@Test
func locationPhotos() async throws {
  let locationId: Location.ID = 13_331_376
  _ = try await api.locationPhotos(id: locationId)
}

@Test
func locatioDetail() async throws {
  let locationId: Location.ID = 13_331_376
  let location = try await api.locationDetail(id: locationId)
  #expect(location.id == locationId)
  #expect(location.name == "Apple Park Visitor Center")
  #expect(location.address?.street1 == "10600 N Tantau Ave")
  #expect(location.address?.street2 == nil)
  #expect(location.address?.city == "Cupertino")
  #expect(location.address?.state == "California")
  #expect(location.address?.country == "United States")
  #expect(location.address?.postalCode == "95014-0739")
  #expect(location.address?.addressString == "10600 N Tantau Ave, Cupertino, CA 95014-0739")
  #expect(
    location.description
      == "Step into the heart of the Apple empire at this sleek and modern building—the only part of the Apple Park campus that’s open to the public. Here, you can tour the innovative exhibition space for a behind-the-scenes look at Apple’s journey, technology, and design principles, head up to the roof terrace for an expansive view of Apple Park, and rub shoulders with other creatives at the cafe. Of course, the highlight of the center is the massive Apple Store where you can browse their full range of products and snag exclusive merchandise. You can check out the center and other tech giants on a tour of Silicon Valley. – Tripadvisor"
  )
  #expect(
    location.webURL == URL(
      string:
        "https://www.tripadvisor.com/Attraction_Review-g32273-d13331376-Reviews-Apple_Park_Visitor_Center-Cupertino_California.html?m=66827"
    )!)
  #expect(
    location.ancestors == [
      .init(level: "City", name: "Cupertino", locationId: 32273),
      .init(level: "State", name: "California", locationId: 28926),
      .init(level: "Country", name: "United States", locationId: 191),
    ])
  #expect(location.latitude == 37.33272)
  #expect(location.longitude == -122.00533)
  #expect(location.timezone == "America/Los_Angeles")
  #expect(location.phoneNumber == "+1 408-961-1560")
  #expect(location.website == URL(string: "http://www.apple.com/retail/appleparkvisitorcenter/")!)
  #expect(
    location.writeReview == URL(
      string:
        "https://www.tripadvisor.com/UserReview-g32273-d13331376-Apple_Park_Visitor_Center-Cupertino_California.html?m=66827"
    )!)
  #expect(
    location.ranking
      == .init(
        geoLocationId: 32273,
        rankingString: "#1 of 7 Shopping in Cupertino",
        geoLocationName: "Cupertino",
        rankingOutOf: 7,
        ranking: 1
      )
  )
  #expect(location.rating == 4.0)
  #expect(
    location.ratingImageUrl == URL(
      string: "https://www.tripadvisor.com/img/cdsi/img2/ratings/traveler/4.0-66827-5.svg")!)
  #expect(location.reviewCount == 247)
  #expect(location.reviewRatingCount == [1: 9, 5: 108, 2: 16, 4: 60, 3: 54])
  #expect(location.photoCount == 427)
  #expect(
    location.seeAllPhotosURL == URL(
      string:
        "https://www.tripadvisor.com/Attraction_Review-g32273-d13331376-m66827-Reviews-Apple_Park_Visitor_Center-Cupertino_California.html#photos"
    )!)
  #expect(location.priceLevel == nil)
  #expect(
    location.hours
      == Hours(
        periods: [
          Period(open: .init(day: 1, time: "1000"), close: .init(day: 1, time: "1900")),
          Period(open: .init(day: 2, time: "1000"), close: .init(day: 2, time: "1900")),
          Period(open: .init(day: 3, time: "1000"), close: .init(day: 3, time: "1900")),
          Period(open: .init(day: 4, time: "1000"), close: .init(day: 4, time: "1900")),
          Period(open: .init(day: 5, time: "1000"), close: .init(day: 5, time: "1900")),
          Period(open: .init(day: 6, time: "1000"), close: .init(day: 6, time: "1900")),
          Period(open: .init(day: 7, time: "1000"), close: .init(day: 7, time: "1800")),
        ],
        weekdayText: [
          "Monday: 10:00 - 19:00",
          "Tuesday: 10:00 - 19:00",
          "Wednesday: 10:00 - 19:00",
          "Thursday: 10:00 - 19:00",
          "Friday: 10:00 - 19:00",
          "Saturday: 10:00 - 19:00",
          "Sunday: 10:00 - 18:00",
        ])
  )
  #expect(location.features == nil)
  #expect(location.cuisines == nil)
  #expect(location.category == .init(name: "attraction", localizedName: "Attraction", value: nil))
  #expect(
    location.subCategories == [
      .init(name: "shopping", localizedName: "Shopping", value: nil)
    ])
  #expect(location.neighborhoods == [])
  #expect(
    location.tripTypes == [
      .init(name: "business", localizedName: "Business", value: "18"),
      .init(name: "couples", localizedName: "Couples", value: "55"),
      .init(name: "solo", localizedName: "Solo travel", value: "36"),
      .init(name: "family", localizedName: "Family", value: "55"),
      .init(name: "friends", localizedName: "Friends getaway", value: "32"),
    ])
}
