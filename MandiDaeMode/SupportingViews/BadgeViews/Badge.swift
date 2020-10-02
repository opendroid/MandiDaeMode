//
//  Badge.swift
//  MandiDaeMode
//
//  Created by Ajay Thakur on 9/27/20.
//

import SwiftUI

struct Badge: View {
  static let rotationCount = 8
  
  var badgeSymbols: some View {
    ForEach (0..<Badge.rotationCount) { i in
      RotatedBadgeSymbol(angle: .degrees( (Double(i) / Double(Badge.rotationCount)) * 360))
        .opacity(0.5)
    }
  }
  
  var body: some View {
    ZStack {
      GeometryReader { geometry in
        BadgeBackground()
        self.badgeSymbols
          .scaleEffect(0.2, anchor: .top)
          .position(x: geometry.size.width / 2.0, y: 0.6 * geometry.size.height)
      }
    }
    .scaledToFit()
  }
}

struct Badge_Previews: PreviewProvider {
  static var previews: some View {
    Badge()
  }
  
}
