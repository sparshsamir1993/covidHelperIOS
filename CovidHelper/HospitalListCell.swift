//
//  HospitalListCell.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-07-13.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//

import UIKit

class HospitalListCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contactLabel: UILabel!
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
        let doubleTapRecognizer
            = UITapGestureRecognizer(target: self, action: #selector(HospitalListCell.doubleTap(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        
        doubleTapRecognizer.delaysTouchesBegan = true
        
        addGestureRecognizer(doubleTapRecognizer)
        
//        let tapRecognizer
//            = UITapGestureRecognizer(target: self, action: #selector(HospitalListCell.tap(_:)))
//        tapRecognizer.delaysTouchesBegan = true
//        tapRecognizer.require(toFail: doubleTapRecognizer)
//        addGestureRecognizer(tapRecognizer)
    }
    @objc func doubleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        print("double tap")
        //currentLines.removeAll(keepingCapacity: false)
//        finishedLines.removeAll(keepingCapacity: false)
//        selectedLineIndex = nil
//           if selectedLineIndex != nil {
//               becomeFirstResponder()
//               let deleteItem = UIMenuItem(title: "Delete",action: #selector(DrawView.deleteLine(_:)))
//               menu.menuItems = [deleteItem]
//               //menu.setTargetRect(CGRect(x: point.x,y: point.y, width:2,height:2), in: self)
//               let menuRect = CGRect(x: point.x,y: point.y, width:2,height:2)
//               menu.showMenu(from: self, rect: menuRect)
//           } else {
//               //menu.setMenuVisible(false, animated: true)
//               menu.hideMenu(from: self)
//           }
        setNeedsDisplay()
    }
    @objc func tap(_ gestureRecognizer: UITapGestureRecognizer) {
           print("In single tap")
           let point = gestureRecognizer.location(in: self)
//           selectedLineIndex = indexOfLineAtPoint(point)
           
           let menu = UIMenuController.shared
//           if selectedLineIndex != nil {
//               becomeFirstResponder()
//               let deleteItem = UIMenuItem(title: "Delete",action: #selector(DrawView.deleteLine(_:)))
//               menu.menuItems = [deleteItem]
//               //menu.setTargetRect(CGRect(x: point.x,y: point.y, width:2,height:2), in: self)
//               let menuRect = CGRect(x: point.x,y: point.y, width:2,height:2)
//               menu.showMenu(from: self, rect: menuRect)
//           } else {
//               //menu.setMenuVisible(false, animated: true)
//               menu.hideMenu(from: self)
//           }
           setNeedsDisplay()
    }
    func update(with hospital: Hospital?) {
        if let currentHosp = hospital {
//            spinner.stopAnimating()
            nameLabel.text = currentHosp.name
        } else {
//            spinner.startAnimating()
            nameLabel.text = ""
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontForContentSizeCategory = true
        contactLabel.adjustsFontForContentSizeCategory = true
        update(with: nil)

    }
    
    func updateLabels() {
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        nameLabel.font = bodyFont
        contactLabel.font = bodyFont
        
    }
    
    

}
