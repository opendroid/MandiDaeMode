/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The model for an individual landmark.
 */

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
  var id: Int
  var name: String
  fileprivate var imageName: String
  fileprivate var coordinates: Coordinates
  var city: String
  var state: String
  var park: String
  var wikiURL: String
  var category: Category
  var isFavorite: Bool
  var isFeatured: Bool
  var description: String
  
  var locationCoordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(
      latitude: coordinates.latitude,
      longitude: coordinates.longitude)
  }
  
  
  enum Category: String, CaseIterable, Codable, Hashable {
    case featured = "Featured"
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"
    case bridges = "Bridges"
  }
}

extension Landmark {
  var image: Image {
    ImageStore.shared.image(name: imageName)
  }
}

struct Coordinates: Hashable, Codable {
  var latitude: Double
  var longitude: Double
}

