//
//  BadgeBackground.swift
//  MandiDaeMode
//
//  Created by Ajay Thakur on 9/30/20.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
      GeometryReader { geomatry in
        let width: CGFloat = min(geomatry.size.width, geomatry.size.height)
        let scaleBy: CGFloat = 0.5
        Path { path in
          let hex = UnitHexagon(arcDegree: 12)
          let points = hex.getPoints()
          path.move(to: points[0].first)
          points.forEach {
            path.addLine(to: $0.first)
            path.addQuadCurve(to: $0.second, control: $0.center)
          }
        }
        .transform(.init(scaleX: width * scaleBy, y: width * scaleBy))
        .transform(.init(translationX: geomatry.size.width/2, y: geomatry.size.height/3.45))
        .fill(LinearGradient(
                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: .init(x: 0.5, y: 0),
                endPoint: .init(x: 0.5, y: 0.8)))
        .aspectRatio(1, contentMode: .fit)
      }
    }
  static let gradientStart = Color(red: 239.0/255, green: 120.0/255, blue: 221.0/255)
  static let gradientEnd = Color(red: 239.0/255, green: 172.0/255, blue: 120.0/255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
