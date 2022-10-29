//
//  ContentView.swift
//  AppRickAndMorty
//
//  Created by Shahid on 29.10.22.
//



import SwiftUI
struct MainView: View {
  
  @State var a = UUID().uuidString

    @State var character = [Result]()

    @State var search = ""
  let width = UIScreen.main.bounds.width

    var body: some View {


        NavigationView {


            List {

              ForEach(search == "" ? character:
                        character.filter( {$0.name
                .contains(search)}
                          )
              )  {
                    new in



                ZStack {
                HStack{
                      CharacterImage(imageURL: "\(new.image)")



                      NavigationLink(


                        destination:
                          VStack {
                          DetailImage(imageURL: "\(new.image)")
                            VStack(spacing:10) {
                              ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                  .stroke(lineWidth: 2)
                                  .frame(width: 200, height:50)
                                  .foregroundColor(.green)
                              Text("About")


                                .font(.title3)
                                .fontWeight(.bold)
                              }
                              HStack(spacing: 90) {
                                VStack(spacing: 20) {
Text("Name")
                                    .fontWeight(.thin)
Text("Gender")
                                    .fontWeight(.thin)
 Text("Status")
                                    .fontWeight(.thin)
 Text("Species")
                                    .fontWeight(.thin)
Text("Type")
                                    .fontWeight(.thin)
 Text("Origin")
                                    .fontWeight(.thin)




     }

                                VStack(spacing:20) {

                          Text("\(new.name)")



                              .font(.title3)
                              .fontWeight(.bold)




                            Text("\(new.gender)")



                                    .font(.title3)
                                    .fontWeight(.bold)




                            Text("\(new.status)")



                                    .font(.title3)
                                    .fontWeight(.bold)




                            Text("\(new.species)")



                                    .font(.title3)
                                    .fontWeight(.bold)



                            Text("\(new.type)")



                                    .font(.title3)
                                    .fontWeight(.bold)



                            Text("\(new.origin.name)")



                                    .font(.title3)
                                    .fontWeight(.bold)

                                }

                            }


                            }
  }
                          .padding(.top , -50)



                      ) {

                      }
                      .opacity(0.0)
                         .buttonStyle(PlainButtonStyle())







                    }

                  VStack(spacing:10) {



                  Text("\(new.name)")
                      .font(.title3)
                      .fontWeight(.bold)


                  Text("\(new.status)")
                      .font(.title3)
                      .fontWeight(.regular)


                  Text("\(new.species)")
                      .font(.title3)
                      .fontWeight(.regular)
                  Text("\(new.gender)")
                      .font(.title3)
                      .fontWeight(.regular)



                  }

                  .padding(.leading , 160)
                }

              }

            }

            .onAppear {
              UITableView.appearance().separatorColor = .clear
              UITableView.appearance().showsVerticalScrollIndicator = false

            }

            .listStyle(.plain)
            .refreshable {
              a = UUID().uuidString
            }
             .onAppear {
                Fetch().datas() { character in
                    self.character = character
}
              

 }
             .searchable(text: $search)

        }

    }

}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        MainView()
        .preferredColorScheme(.light)

        MainView()
          .preferredColorScheme(.dark)
          .previewInterfaceOrientation(.portrait)
 }
    }
}
