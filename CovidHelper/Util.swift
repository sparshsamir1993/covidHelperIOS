//
//  Util.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-06-10.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    public func makeToast(_ message: String){
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2-95 , y: self.view.frame.size.height-200, width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {finished in
            toastLabel.removeFromSuperview()
        })
    }
}
