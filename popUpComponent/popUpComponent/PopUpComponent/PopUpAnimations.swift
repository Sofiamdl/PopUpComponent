//
//  PopUpAnimations.swift
//  popUpComponent
//
//  Created by sml on 28/09/22.
//

import UIKit

extension Popup {
    func zoomIn() {
        self.stackView.transform = CGAffineTransform.identity.scaledBy(x: 0.01, y: 0.01)
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {

            self.stackView.transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)

      }) { (finished) in
          UIView.animate(withDuration: 0.25, animations: {
            
              self.stackView.transform = CGAffineTransform.identity 
        })
     }
    }
    
    func zoomOut() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            
            self.stackView.transform = CGAffineTransform.identity.scaledBy(x: 0.01, y: 0.01)

      }) { (finished) in
          UIView.animate(withDuration: 0, animations: {
            
              self.stackView.transform = CGAffineTransform.identity.scaledBy(x: 0.01, y: 0.01)

        })
      }
    }
}
