//
//  InputInfoController.swift
//  MyPets
//
//  Created by Дмитрий Ахмеров on 16.08.2021.
//

import UIKit

final class InputInfoController: UIViewController {
    // MARK: - Properties
    private let backgroundView: UIView = {
        let view = UIView()
        view.setBlurEffect(view, frame: UIScreen.main.bounds)
        return view
    }()
    private let textFieldBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = UIScreen.main.bounds.height * 0.06 / 2
        return view
    }()
    private let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        return textField
    }()
    private let catOutline = UIImageView(image: UIImage(named: "catOutline"))
    private let dogOutline = UIImageView(image: UIImage(named: "dogOutline"))
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        textField.delegate = self
        setBackgroundViewConstraints()
        setTextFieldBackgroundViewConstraints()
        setTextFieldConstraints()
        setCatOutlineConstraints()
        setDogOutlineConstraints()
    }
}
    
// MARK: - Methods
extension InputInfoController {
    private func setBackgroundViewConstraints() {
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    private func setTextFieldBackgroundViewConstraints() {
        view.addSubview(textFieldBackgroundView)
        textFieldBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textFieldBackgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height / 3),
            textFieldBackgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            textFieldBackgroundView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            textFieldBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    private func setTextFieldConstraints() {
        textFieldBackgroundView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: textFieldBackgroundView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: textFieldBackgroundView.bottomAnchor),
            textField.leftAnchor.constraint(equalTo: textFieldBackgroundView.leftAnchor, constant: 15),
            textField.rightAnchor.constraint(equalTo: textFieldBackgroundView.rightAnchor, constant: -15)
        ])
    }
    private func setCatOutlineConstraints() {
        view.addSubview(catOutline)
        catOutline.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            catOutline.widthAnchor.constraint(equalTo: textField.widthAnchor, multiplier: 0.2),
            catOutline.heightAnchor.constraint(equalTo: catOutline.widthAnchor),
            catOutline.bottomAnchor.constraint(equalTo: textFieldBackgroundView.topAnchor),
            catOutline.leftAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    private func setDogOutlineConstraints() {
        view.addSubview(dogOutline)
        dogOutline.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dogOutline.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            dogOutline.heightAnchor.constraint(equalTo: dogOutline.widthAnchor),
            dogOutline.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dogOutline.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
}

// MARK: - Actions
extension InputInfoController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [ weak self ] in
            self?.dismiss(animated: true, completion: nil)
        }
        return true
    }
}
