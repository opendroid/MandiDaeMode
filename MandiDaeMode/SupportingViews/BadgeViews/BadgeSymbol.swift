//
//  BadgeSymbol.swift
//  MandiDaeMode
//
//  Created by Ajay Thakur on 9/30/20.
//

import SwiftUI

struct BadgeSymbol: View {
  static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)

  var body: some View {
    GeometryReader { geomatry in
      Path { path in
        let w = min(geomatry.size.width, geomatry.size.height)
        let h = w * 0.8 // height
        let s = w * 0.03 // s, spacing
        let m = w / 2 // m, middle
        let tw = 0.226 * w // top width
        let th = 0.488 * h // top height
        
        path.addLines([
          CGPoint(x: m, y: s),
          CGPoint(x: m - tw, y: th - s),
          CGPoint(x: m, y: th / 2 + s),
          CGPoint(x: m + tw, y: th - s),
          CGPoint(x: m, y: s)
        ])
        path.move(to: CGPoint(x: m, y: th / 2 + s * 3))
        path.addLines([
          CGPoint(x: m - tw, y: th + s),
          CGPoint(x: s, y: h - s),
          CGPoint(x: w - s, y: h -  s),
          CGPoint(x: m + tw, y: th + s),
          CGPoint(x: m, y: th / 2 + s * 3)
        ])
      }
      .fill(Self.symbolColor)
    }
  }
}

struct BadgeSymbol_Previews: PreviewProvider {
  static var previews: some View {
    BadgeSymbol()
  }
}
