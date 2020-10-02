//
//  LandmarkList.swift
//  MandiDaeMode
//
//  Created by Ajay Thakur on 9/26/20.
//

import SwiftUI

struct LandmarkList: View {
  @EnvironmentObject var userData: UserData
  
  var body: some View {
    NavigationView {
      List {
        // UX Toggel
        Toggle(isOn: $userData.showFavouritesOnly, label: {
          Text("Favourites Only")
        })
        // Show eah row of landmarks
        ForEach(userData.landmarks) { landmark in
          if !self.userData.showFavouritesOnly || landmark.isFavorite {
            NavigationLink (destination: LandmarkDetail(landmark: landmark)) {
              LandmarkRow(landmark: landmark)
            }
          }
        }
      }
      .navigationBarTitle(Text("Landmarks"))
    }
  }
}

struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkList()
      .environmentObject(UserData())
  }
}
