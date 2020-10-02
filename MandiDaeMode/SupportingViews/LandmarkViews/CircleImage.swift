//
//  CircleImage.swift
//  MandiDaeMode
//
//  Created by Ajay Thakur on 9/26/20.
//

import SwiftUI

struct CircleImage: View {
  // Image to show
  var image: Image
  
  var body: some View {
    VStack {
      image
        .resizable()
        .scaledToFit()
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4.0))
        .shadow(radius:  10)
    }.frame(width: 256, height: 256, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
  }
}


struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
      CircleImage(image: Image("mandiBridge"))
    }
}
