//
//  UserData.swift
//  MandiDaeMode
//
//  Created by Ajay Thakur on 9/27/20.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
  @Published var showFavouritesOnly = false
  @Published var landmarks = landmarkData
  @Published var profile = Profile.default
}
