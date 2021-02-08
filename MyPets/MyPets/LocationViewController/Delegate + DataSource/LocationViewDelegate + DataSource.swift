//
//  LocationViewControllerDelegate + DataSource.swift
//  MyPets
//
//  Created by Дмитрий Ахмеров on 22.10.2020.
//

import UIKit

extension LocationViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = models[indexPath.row]
        let itemSize = item.buttonTitle.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)])

        return CGSize(width: itemSize.width + 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellFilterId", for: indexPath) as! LocationViewCell
        let data = models[indexPath.item]
        cell.model = data
        
        switch indexPath.item {
        case 0:
            cell.valueButton.removeTarget(nil, action: nil, for: .allEvents)
            cell.valueButton.addTarget(self, action: #selector(response0), for: .touchUpInside)
        case 1:
            cell.valueButton.removeTarget(nil, action: nil, for: .allEvents)
            cell.valueButton.addTarget(self, action: #selector(response1), for: .touchUpInside)
        case 2:
            cell.valueButton.removeTarget(nil, action: nil, for: .allEvents)
            cell.valueButton.addTarget(self, action: #selector(response2), for: .touchUpInside)
        case 3:
            cell.valueButton.removeTarget(nil, action: nil, for: .allEvents)
            cell.valueButton.addTarget(self, action: #selector(response3), for: .touchUpInside)
        case 4:
            cell.valueButton.removeTarget(nil, action: nil, for: .allEvents)
            cell.valueButton.addTarget(self, action: #selector(response4), for: .touchUpInside)
        case 5:
            cell.valueButton.removeTarget(nil, action: nil, for: .allEvents)
            cell.valueButton.addTarget(self, action: #selector(response5), for: .touchUpInside)
        case 6:
            cell.valueButton.removeTarget(nil, action: nil, for: .allEvents)
            cell.valueButton.addTarget(self, action: #selector(response6), for: .touchUpInside)
        case 7:
            cell.valueButton.removeTarget(nil, action: nil, for: .allEvents)
            cell.valueButton.addTarget(self, action: #selector(response7), for: .touchUpInside)
        default:
            break
        }
        
        return cell
    }
    
    @objc func response0() {
        print("button 0 - \(searchResponseText)")
        searchResponseText = models[0].searchText
        searchInMap(place: searchResponseText)
    }
    @objc func response1() {
        print("button 1 - \(searchResponseText)")
        searchResponseText = models[1].searchText
        searchInMap(place: searchResponseText)
    }
    @objc func response2() {
        print("button 2 - \(searchResponseText)")
        searchResponseText = models[2].searchText
        searchInMap(place: searchResponseText)
    }
    @objc func response3() {
        print("button 3 - \(searchResponseText)")
        searchResponseText = models[3].searchText
        searchInMap(place: searchResponseText)
    }
    @objc func response4() {
        print("button 4 - \(searchResponseText)")
        searchResponseText = models[4].searchText
        searchInMap(place: searchResponseText)
    }
    @objc func response5() {
        print("button 5 - \(searchResponseText)")
        searchResponseText = models[5].searchText
        searchInMap(place: searchResponseText)
    }
    @objc func response6() {
        print("button 6 - \(searchResponseText)")
        searchResponseText = models[6].searchText
        searchInMap(place: searchResponseText)
    }
    @objc func response7() {
        print("button 7 - \(searchResponseText)")
        searchResponseText = models[7].searchText
        searchInMap(place: searchResponseText)
    }
}
