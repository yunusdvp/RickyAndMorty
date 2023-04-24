//
//  Location.swift
//  collecdeneme
//
//  Created by Yunus Emre ÖZŞAHİN on 8.04.2023.
//

struct Location: Decodable {
    let name: String?
    let type: String?
    //let dimension: String?
    let residents: [String]
    init(/*id: Int,*/ name: String, type: String, residents: [String]) {
        self.name = name
        self.type = type
        self.residents = residents
    }
}

struct LocationCH : Decodable{
    let name : String
    let url: String
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
