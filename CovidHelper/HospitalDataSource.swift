//
//  HospitalDataSource.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-08-13.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//

import Foundation
import UIKit

class HospitalDataSource : NSObject, UITableViewDataSource{
    var hospitalList = [Hospital]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(hospitalList.count)
        return hospitalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HospitalListCell", for: indexPath) as! HospitalListCell
        cell.nameLabel.text = hospitalList[indexPath.row].name
        return cell
    }
    
    
}
