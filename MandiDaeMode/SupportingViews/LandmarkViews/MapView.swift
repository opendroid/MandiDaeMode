//
//  MapView.swift
//  MandiDaeMode
//
//  Created by Ajay Thakur on 9/26/20.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  var coordinate: CLLocationCoordinate2D
  var title: String
  
  func makeUIView(context: Context) ->  MKMapView {
    MKMapView(frame: .zero)
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    uiView.setRegion(region, animated: true)
    let annotation = MKPointAnnotation()
    annotation.title = title
    annotation.coordinate = coordinate
    uiView.addAnnotation(annotation)
  }
  
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
      MapView(coordinate: landmarkData[0].locationCoordinate, title: landmarkData[0].name)
    }
}
