//
//  ShowDetailsViewController.swift
//  fleetFox
//
//  Created by Venkat Kotu on 2/12/16.
//  Copyright © 2016 VenkatKotu. All rights reserved.
//

import UIKit

class ShowDetailsViewController: UIViewController {

    @IBOutlet weak var make: UILabel!
    
    @IBOutlet weak var model: UILabel!
    
    @IBOutlet weak var machineId: UILabel!
    var receivedMachineId: String = ""
    
    
    @IBOutlet weak var lastUpdatedOn: UILabel!
    
    @IBOutlet weak var notes: UILabel!
    
    
    @IBOutlet weak var location: UILabel!
    
    
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("mcahine id from third")
        print(receivedMachineId)
          if let retrievedDict = NSUserDefaults.standardUserDefaults().dictionaryForKey("equipment") as? Dictionary<String,Dictionary<String,String>> {
            var myDict = retrievedDict
            var newDict = myDict["\(receivedMachineId)"]
            make.text = newDict!["make"]
            model.text = newDict!["model"]
            machineId.text = newDict!["machineId"]
            lastUpdatedOn.text = newDict!["lastUpdated"]
            notes.text = newDict!["notes"]
            status.text = newDict!["machineState"]
            let locDetails = "Latitude : \(newDict!["lat"]!)   \n  Longitutde : \(newDict!["long"]!)"
            location.text = locDetails
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
            
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func update(sender: AnyObject) {
     
        self.performSegueWithIdentifier("showUpdate", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
