//
//  CharacterModel.swift
//  AppRickAndMorty
//
//  Created by Shahid on 29.10.22.
//

import Foundation

struct Welcome: Codable {
    let info: Info
    let results: [Result]
}


struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}


struct Result: Identifiable, Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
struct Location: Codable {
    let name: String
    let url: String
}


class Fetch  {
    func datas(completion:@escaping ([Result]) -> ()) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=2") else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            let characters = try! JSONDecoder().decode(Welcome.self, from: data)

            DispatchQueue.main.async {
              completion(characters.results)
            }
        }.resume()
    }
}



