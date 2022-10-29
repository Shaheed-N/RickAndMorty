//
//  ImageView.swift
//  AppRickAndMorty
//
//  Created by Shahid on 29.10.22.
//


import SwiftUI

struct CharacterImage: View {
  var imageURL = ""

    var body: some View {




          AsyncImage(url: URL(string: imageURL)) { image in
            image
              .resizable()
              .scaledToFit()
              .cornerRadius(5)
              .frame(width: 150, height: 150)

          } placeholder: {
            ZStack {
             RoundedRectangle(cornerRadius: 20)

                .frame(width: 150, height: 150)
                .foregroundColor(.gray)
                .opacity(0.6)

              ActivityIndicator()
            }
          }
          .frame(maxWidth: .infinity)
        }
      }




struct CharacterImage_Previews: PreviewProvider {
    static var previews: some View {
      CharacterImage()

      }

}
struct ActivityIndicator: View {

    @State var degress = 0.0

    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.6)
            .stroke(Color.green, lineWidth: 5.0)
            .frame(width: 30, height: 30)
            .rotationEffect(Angle(degrees: degress))
            .onAppear(perform: {self.start()})
    }

    func start() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            withAnimation {
                self.degress += 10.0
            }
            if self.degress == 360.0 {
                self.degress = 0.0
            }
        }
    }
}
struct DetailImage: View {
  var imageURL = ""
  let width = UIScreen.main.bounds.width
    var body: some View {




          AsyncImage(url: URL(string: imageURL)) { image in
            if width > 700 {
            image

              .resizable()
              .scaledToFit()

              .frame(width:700, height: 550)

            }
            else {
              image

                .resizable()
                .scaledToFit()

                .frame(width: 300, height: 250)
            }


          } placeholder: {
            ZStack {
             RoundedRectangle(cornerRadius: 20)

                .frame(width: 300, height: 250)
                .foregroundColor(.gray)
                .opacity(0.6)

              ActivityIndicator()
            }
          }
          .frame(maxWidth: .infinity)
        }
      }

