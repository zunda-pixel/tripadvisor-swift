# Tripadvisor Kit

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fzunda-pixel%2Ftripadvisor-swift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/zunda-pixel/tripadvisor-swift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fzunda-pixel%2Ftripadvisor-swift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/zunda-pixel/tripadvisor-swift)

Tripadvisor Kit for [Tripadivisor API](https://tripadvisor-content-api.readme.io)

## Search Locations

```swift
import TripadvisorKit

let api = TripadvisorAPI(apiKey: "API_KEY")
let query = "Location Name"
let locations = try await api.searchLocations(query: query)
print(locations)
```

```shell
[
    Location(
        id: 13331376, 
        name: "Apple Park Visitor Center", 
        description: nil, 
        webURL: nil, 
        address: Address(
            street1: "10600 N Tantau Ave",
            street2: nil,
            city: "Cupertino",
            state: "California",
            country: "United States",
            postalCode: "95014-0739",
            addressString: "10600 N Tantau Ave, Cupertino, CA 95014-0739"
        ),
        ancestors: nil,,,
    ),
]
```

## Search Near Locations

```swift
let point = Location.Point(latitude: 35.652832, longitude: 139.839478)
let locations = try await api.searchNearLocations(point: point)
```

## Get Location Review

```swift
let locationId: Location.ID = "13331376"
let reviews = try await api.locationReviews(id: locationId)
```

## Get Loaction Photos

```swift
let locationId: Location.ID = "13331376"
let photos = try await api.locationPhotos(id: locationId)
```

## Get Loaction Detail

```swift
let locationId: Location.ID = "13331376"
let location = try await api.locationDetail(id: locationId)
```
