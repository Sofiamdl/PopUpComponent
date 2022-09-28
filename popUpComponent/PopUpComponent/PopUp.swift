//
//  PopUp.swift
//  popUpComponent
//
//  Created by sml on 28/09/22.
//

import UIKit

class Popup: UIView {
    let buttonOutside: UIButton = {
        let buttonAux = UIButton()
        buttonAux.tintColor = UIColor.clear
        var configuration = UIButton.Configuration.filled()
        buttonAux.configuration = configuration
        return buttonAux
    }()

    let titleLabelContainer = UIView()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        let systemFont = UIFont.systemFont(ofSize: 32, weight: .regular)
        title.font = systemFont
        title.textColor = .white
        title.textAlignment = .center
        title.numberOfLines = 0
        title.sizeToFit()
        return title
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
        configurations() 
        buttonOutside.addTarget(self, action: #selector(closePopup), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension Popup {
    func configure(with model: PopUpViewModel){
        titleLabel.text = model.title
    }
    
    func openPopUp() {
        self.isHidden = false
        zoomIn()
    }
    
    @objc func closePopup() {
        zoomOut()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.27) {
            self.isHidden = true
            return
        }
    }

}
