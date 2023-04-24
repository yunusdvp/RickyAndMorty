//
//  CharacterCell.swift
//  collecdeneme
//
//  Created by Yunus Emre ÖZŞAHİN on 8.04.2023.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    
    @IBOutlet weak var rightImage: UIImageView!
    func configure(with character: Character, isSelected: Bool) {
        
        if character.gender == "Male"{
            if let imageUrl = URL(string: character.image) {
                leftImage.load(url: imageUrl)
            }
            rightImage.image = UIImage(named: character.gender)
            name.text = character.name
        }
        else if character.gender == "Female"{
            if let imageUrl = URL(string: character.image) {
                rightImage.load(url: imageUrl)
            }
            leftImage.image = UIImage(named: character.gender)
            name.textColor = .red
            name.text = character.name
            
        }
        else{
            if let imageUrl = URL(string: character.image) {
                rightImage.load(url: imageUrl)
            }
            leftImage.image = UIImage(named: character.gender)
            name.textColor = .blue
            name.text = character.name
            
        }
    }
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
