//
//  HexagonAT.swift
//  MandiDaeMode
//
//  Created by Ajay Thakur on 9/28/20.
//

import SwiftUI
/**
  Creates a vertical Hexagon with a raduis as 1 unit. Round edge by providing a arc angle
   between two points: first and second with control point at center.
   - arcDegree: Angle is arc at the center of the Hexagon
 
   - Note: For calculations of the vertices see image:
    ![Math](../Resources/HexagonMath.jpeg)
 
 */
struct UnitHexagon {
  let radius: CGFloat = 1.0
  var arcDegree: CGFloat = 10
  
  let rad120 = CGFloat(Double.pi) * (120.0/180.0)
  let rad30 = CGFloat(Double.pi) * (30.0/180.0)
  
  struct HexagonCorner {
    var first, center, second: CGPoint
  }
  
  //: Hexagon is created as a vertical unit length side hexagon. See the
  //   picture in Resources/HexagonMath.jpeg
  //
  // https://developer.apple.com/documentation/uikit/uibezierpath/1624351-addquadcurve
  //
  func getPoints () -> [HexagonCorner] {
    let radArc: CGFloat = CGFloat(Double.pi) * (arcDegree/180.0)
    var a1, ac, a2: CGPoint // Point A1 --> curve to A2 with control point as A at center
    var b1, bc, b2: CGPoint
    var c1, cc, c2: CGPoint
    var d1, dc, d2: CGPoint
    var e1, ec, e2: CGPoint
    var f1, fc, f2: CGPoint
    let r: CGFloat = radius
    let l: CGFloat =  r * sin(radArc) / sin(rad120 - radArc)
    let lP = CGPoint(x: l * cos(rad30), y: l * sin(rad30)) // lengths of arc segment
    
    // Points B and D mirror y-axis
    bc = CGPoint(x: r * cos(rad30), y: r * sin(rad30))
    dc = CGPoint(x: -bc.x, y: bc.y)
    b1 = CGPoint(x: bc.x, y: bc.y - l)
    d2 = CGPoint(x: -b1.x, y: b1.y)
    b2 = CGPoint(x: bc.x - lP.x, y: bc.y + lP.y)
    d1 = CGPoint(x: -b2.x, y: b2.y)

    
    // Points A and E mirror y-axis
    ac = CGPoint(x: bc.x, y: -bc.y)
    ec = CGPoint(x: -ac.x, y: ac.y)
    a1 = CGPoint(x: b2.x, y: -b2.y)
    e2 = CGPoint(x: -a1.x, y: a1.y)
    a2 = CGPoint(x: b1.x, y: -b1.y)
    e1 = CGPoint(x: -a2.x, y: a2.y)
    
    
    // Points C and F mirror x-axis
    cc = CGPoint(x: 0, y: r)
    fc = CGPoint(x: 0, y: -r)
    c1 = CGPoint(x: lP.x, y : cc.y - lP.y)
    f2 = CGPoint(x: c1.x, y : -c1.y)
    c2 = CGPoint(x: -lP.x, y: cc.y - lP.y)
    f1 = CGPoint(x: c2.x, y: -c2.y)
    
    
    return [HexagonCorner(first: a1, center: ac, second: a2),
            HexagonCorner(first: b1, center: bc, second: b2),
            HexagonCorner(first: c1, center: cc, second: c2),
            HexagonCorner(first: d1, center: dc, second: d2),
            HexagonCorner(first: e1, center: ec, second: e2),
            HexagonCorner(first: f1, center: fc, second: f2),
    ]
  }
}

