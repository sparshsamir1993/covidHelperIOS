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
    let hospDataSource  = HospitalDataSource()
    
    @IBOutlet var hospTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
        let hospitalStore = HospitalListStore() //loading the hospital store
        hospTableView.dataSource = hospDataSource
        hospTableView.delegate = self
        self.hospitalStore = hospitalStore
//        updateDataSource()
        hospitalStore.fetchHospitalListFromApi {(hospitalresult) ->Void in
            self.updateDataSource()
        
        }
    }
    private func updateDataSource() {
        
        hospitalStore.fetchAllHospitals  {
            (hospitalsResult) in
            
            switch hospitalsResult {
            case let .success(hospitals):
                self.hospDataSource.hospitalList = hospitals
            case .failure:
                
                self.hospDataSource.hospitalList.removeAll()
            }
            self.tableView.reloadSections(IndexSet(integer:0), with: UITableView.RowAnimation.left)
        }
    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return hospitalStore.allHospitals.count
//    }
    
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell {
//       let cell = tableView.dequeueReusableCell(withIdentifier: "HospitalListCell", for: indexPath) as! HospitalListCell
//        let hospital = hospitalStore?.allHospitals[indexPath.row]
//        cell.nameLabel?.text = hospital?.name
//        cell.contactLabel?.text = (hospital?.contact)
//        return cell
//        let hospital = hospDataSource.hospitalList[indexPath.row]
//        print(hospital)
//        var cellCurr : UITableViewCell!
//        hospitalStore.fetchHospital(for: hospital) { (result)->Void in
//
//            guard let hospitalIndex = self.hospDataSource.hospitalList.firstIndex(of: hospital),
//                case let .success(hospital) = result
//            else {
//                print("noooooope")
//                return
//            }
//            let hospitalIndexPath = IndexPath(item: hospitalIndex, section: 0)
//            if let cell = self.hospTableView.cellForRow(at: hospitalIndexPath) as? HospitalListCell {
//                print(hospital)
//                cell.update(with: hospital)
//                cellCurr = cell
//
//            }
//
//        }
//        return cellCurr
//    }
//
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showHospital"?:
            if let row = tableView.indexPathForSelectedRow?.row {
                let hospital = hospDataSource.hospitalList[row]
                let hospitalDetailController = segue.destination as! HospitalDetailController
                hospitalDetailController.hospital = hospital
            }
        default:
            var a: Int!
        }
    }
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
}
