//
//  ViewController.swift
//  popUpComponent
//
//  Created by sml on 28/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    let popUpButton: UIButton = {
        let buttonAux = UIButton()
        var configuration = UIButton.Configuration.filled()
        buttonAux.configuration = configuration
        buttonAux.setAttributedTitle(NSAttributedString(string: "Open PopUp"), for: .normal)
        return buttonAux
    }()
    
    let popUp: Popup = {
        let popup = Popup()
        let model = PopUpViewModel(title: "Opened the popUp :)")
        popup.configure(with: model)
        return popup
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurations()
        popUpButton.addTarget(self, action: #selector(openPopUp), for: .touchUpInside)
    }
    
    func addSubviews()  {
        view.addSubview(popUpButton)
        view.addSubview(popUp)

    }

    func setUpConstraints() {
        popUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        popUp.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popUp.topAnchor.constraint(equalTo: self.view.topAnchor),
            popUp.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            popUp.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            popUp.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    @objc func openPopUp(){
        popUp.openPopUp()
    }
    
    func configurations () {
        addSubviews()
        setUpConstraints()
        view.backgroundColor = .white
    }
}

