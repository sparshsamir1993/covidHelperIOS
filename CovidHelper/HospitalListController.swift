//
//  HospitalListController.swift
//  CovidHelper
//
//  Created by Sparsh Samir on 2020-07-11.
//  Copyright © 2020 Sparsh Samir. All rights reserved.
//

import UIKit

class HospitalListController :  UITableViewController  {
    
    var hospitalStore : HospitalListStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
        let hospitalStore = HospitalListStore() //loading the hospital store
        self.hospitalStore = hospitalStore
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return hospitalStore.allHospitals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HospitalListCell", for: indexPath) as! HospitalListCell
        let hospital = hospitalStore?.allHospitals[indexPath.row]
        cell.nameLabel?.text = hospital?.name
        cell.contactLabel?.text = (hospital?.contact)
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showHospital"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                let hospital = hospitalStore.allHospitals[row]
                let hospitalDetailController = segue.destination as! HospitalDetailController
                hospitalDetailController.hospital = hospital
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
}
