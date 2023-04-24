//
//  ViewController.swift
//  RickyAndMortyy
//
//  Created by Yunus Emre ÖZŞAHİN on 24.04.2023.
//

import UIKit


class ViewController: UIViewController {
    
  
    @IBOutlet weak var locationCollection: UICollectionView!
    
    @IBOutlet weak var characterCollection: UICollectionView!
    var locations: [Location] = []
    var selectedLocationIndex = 0
    var selectedCharacterIndex = 0
    var characters: [Character] = []
    var charactersURL : String = ""
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        locationCollection.delegate = self
        locationCollection.dataSource = self
        LocationUrlSession()
        characterCollection.delegate = self
        characterCollection.dataSource = self

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
   
}


struct LocationResults: Decodable {
    let results: [Location]
}
struct CharacterResults: Decodable {
    let results: [Character]
}



extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == self.locationCollection){
            return locations.count
        }else if(collectionView == self.characterCollection){
            return characters.count
        }
            
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.locationCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationCell", for: indexPath) as! LocationCell
            let location = locations[indexPath.row]
            
            cell.configure(with: location, isSelected: indexPath.row == selectedLocationIndex)
            return cell
            
        }else if(collectionView == self.characterCollection){
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
            let character = characters[indexPath.row]
            cell2.configure(with: character,isSelected: indexPath.row == selectedCharacterIndex)
            return cell2
        }
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == locationCollection {
            let selectedLocation = locations[indexPath.row]
            
            characters.removeAll()
            let group = DispatchGroup()
            
            for residentURL in selectedLocation.residents {
                group.enter()
                NetworkManager.shared.fetchData(from: residentURL) { data in
                    if let characterDictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: characterDictionary, options: [])
                            let decoder = JSONDecoder()
                            let character = try decoder.decode(Character.self, from: jsonData)
                            self.characters.append(character)
                        } catch let error {
                            print("Error decoding character: \(error)")
                        }
                    }
                    
                    group.leave()
                }
            }
            // Tüm karakterler yüklendiğinde alt koleksiyonu güncelle
            group.notify(queue: .main) {
                self.characterCollection.reloadData()
                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
            }
            
        } else {
            // Karakter koleksiyonundan bir hücre seçildiğinde çalışacak kod
            let selectedCharacter = characters[indexPath.row]
            performSegue(withIdentifier: "DetailSegue", sender: selectedCharacter)
            }
                  
            
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue",
           let destinationVC = segue.destination as? DetailViewController,
           let selectedCharacter = sender as? Character {
            destinationVC.character = selectedCharacter
        }
    }

    
    
    
    func LocationUrlSession(){
        let url = URL(string: "https://rickandmortyapi.com/api/location/")!
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data returned from API")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(LocationResults.self, from: data)
                self.locations = results.results
                DispatchQueue.main.async {
                    self.locationCollection.reloadData()
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
}
