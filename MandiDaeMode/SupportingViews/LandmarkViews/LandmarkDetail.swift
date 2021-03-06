//
//  ContentView.swift
//  MandiDaeMode
//
//  Created by Ajay Thakur on 9/26/20.
//

import SwiftUI

struct LandmarkDetail: View {
  @EnvironmentObject var userData: UserData
  var landmark: Landmark
  var landmarkIndex: Int {
    userData.landmarks.firstIndex(where: {$0.id == landmark.id})!
  }
  
  var body: some View {
    VStack {
      VStack {
        MapView(coordinate: landmark.locationCoordinate, title: landmark.name)
          .edgesIgnoringSafeArea(.top)
          .frame(height:300)
        CircleImage(image: landmark.image)
          .offset(y: -150)
          .padding(.bottom, -150)
      }
      
      VStack (alignment: .leading) {
        HStack {
          Text(landmark.name)
            .font(.title)
          Button(action: {self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()}) {
            // Show image selected or other
            if self.userData.landmarks[self.landmarkIndex].isFavorite {
              Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            } else {
              Image(systemName: "star")
                .foregroundColor(.gray)
            }
          }
        }
        HStack {
          Text(landmark.city)
            .font(.subheadline)
          Spacer()
          Text(landmark.state)
            .font(.subheadline)
        }
      }
      .padding()
      Spacer()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkDetail(landmark: landmarkData[0])
      .environmentObject(UserData())
  }
}
