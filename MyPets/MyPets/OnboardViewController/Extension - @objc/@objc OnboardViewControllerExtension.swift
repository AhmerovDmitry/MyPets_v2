//
//  @objc OnboardViewControllerExtension.swift
//  MyPets
//
//  Created by Дмитрий Ахмеров on 11.10.2020.
//

import UIKit

@objc
extension OnboardViewController {
    func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, models.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        if nextIndex == 3 {
            doneButton.removeTarget(nil, action: nil, for: .allEvents)
            doneButton.setTitle("Приступим!", for: .normal)
            doneButton.backgroundColor = UIColor.CustomColor.purple
            doneButton.setTitleColor(.white, for: .normal)
            doneButton.addTarget(self, action: #selector(presentController), for: .touchUpInside)
            
            closeButton.isHidden = true
        }
    }
    @objc func presentController() {
        let authorizationVC = AuthorizationViewController()
        authorizationVC.modalPresentationStyle = .fullScreen
        present(authorizationVC, animated: false, completion: nil)
        presentPremiumController(on: authorizationVC)
    }
}