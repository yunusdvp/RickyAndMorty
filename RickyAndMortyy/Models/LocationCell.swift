//
//  LocationCell.swift
//  collecdeneme
//
//  Created by Yunus Emre ÖZŞAHİN on 8.04.2023.
//

import UIKit

class LocationCell: UICollectionViewCell {
    var charactersURL: String?
    @IBOutlet weak var nameLabel: UILabel!
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? .blue : .gray
        }
    }

    func configure(with location: Location, isSelected: Bool) {
        nameLabel.text = location.name
        nameLabel.sizeToFit()        
        
    }
   
}
