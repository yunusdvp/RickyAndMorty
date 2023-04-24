//
//  Character.swift
//  collecdeneme
//
//  Created by Yunus Emre ÖZŞAHİN on 8.04.2023.
//

struct Character: Decodable{
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender:String
    let origin : Origin
    let location : LocationCH
    let image: String
    let episode : [String]
    let url : String
    let created : String
    
    /*init(name: String, gender: String, image: String) {
        self.name = name
        self.gender = gender
        self.image = image
    }*/
    init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: Origin, location: LocationCH, image: String, episode: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}
