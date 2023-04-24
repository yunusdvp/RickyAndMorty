//
//  DetailViewController.swift
//  collecdeneme
//
//  Created by Yunus Emre ÖZŞAHİN on 23.04.2023.
//

import UIKit

class DetailViewController: UIViewController {
    var character: Character?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var specy: UILabel!
    
    @IBOutlet weak var origin: UILabel!
    
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var episodes: UILabel!
    
    
    @IBOutlet weak var gender: UILabel!
    
    @IBOutlet weak var createdAt: UILabel!
    
    
    @IBOutlet weak var statusValue: UILabel!
    
    @IBOutlet weak var specyValue: UILabel!
    
    @IBOutlet weak var originValue: UILabel!
    
    @IBOutlet weak var locationValue: UILabel!
    
    @IBOutlet weak var episodesValue: UILabel!
    
    @IBOutlet weak var genderValue: UILabel!
    
    
    @IBOutlet weak var createdAtValue: UILabel!
    
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        //imageView.translatesAutoresizingMaskIntoConstraints = false
       // imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        //imageView.widthAnchor.constraint(equalToConstant: 275).isActive = true
        //imageView.heightAnchor.constraint(equalToConstant: 275).isActive = true
        //imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

                
        print(character?.location.name)
        nameLabel.text = character?.name
        statusValue.text = character?.status
        specyValue.text = character?.species
        originValue.text = character?.origin.name
        genderValue.text = character?.gender
        locationValue.text = character?.location.name
        let episodeArray = character?.episode
        let filteredArray = episodeArray!.compactMap { str in
            let digits = str.filter(\.isNumber)
            return digits.isEmpty ? nil : Int(digits)
        }
        let labelString = filteredArray.map { String($0) }.joined(separator: ", ")
        episodesValue.text = labelString


        
        //episodesValue.text = character?.episode.
        createdAtValue.text = character?.created
        let imageUrl = URL(string : character!.image)!
        imageView.load(url: imageUrl)
        }
        
    }

