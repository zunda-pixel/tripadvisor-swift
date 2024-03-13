# Tripadvisor Kit

Tripadvisor Kit for [Tripadivisor API](https://tripadvisor-content-api.readme.io)

## Search Locations

```swift
import TripadvisorKit

let api = TripadvisorAPI(apiKey: "API_KEY")
let query = "Location Name"
let locations = try await api.searchLocations(query: query)
print(locations)
```

```log
[
    TripadvisorKit.Location(
        id: 1061568,
        name: "Giolitti",
        description: nil, 
        webURL: nil, 
        address: Optional(TripadvisorKit.Address(
            street1: "Via Degli Uffici del Vicario 40", street2: Optional("A pochi passi dal Pantheon"), city: "Rome", 
            state: nil, 
            country: "Italy", 
            postalCode: Optional("00144"), 
            addressString: "Via Degli Uffici del Vicario 40 A pochi passi dal Pantheon, 00144 Rome Italy"
        )),
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
let locationId: Location.ID = "15654717"
let reviews = try await api.locationReviews(locationId: locationId)
```

## Get Loaction Photos

```swift
let locationId: Location.ID = "15654717"
let photos = try await api.locationPhotos(locationId: locationId)
```

## Get Loaction Detail

```swift
let locationId: Location.ID = "15654717"
let location = try await api.locationDetail(locationId: locationId)
```