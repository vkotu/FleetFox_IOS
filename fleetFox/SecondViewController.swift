//
//  SecondViewController.swift
//  fleetFox
//
//  Created by Venkat Kotu on 2/10/16.
//  Copyright © 2016 VenkatKotu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,SSRadioButtonControllerDelegate {

   
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var make: UILabel!
    var receivedMake: String = ""
    var receivedModel: String = ""
    var receivedMachineId: String = ""
    var receivedNotes: String = ""
    var receivedStatus: String = ""
    var lastUpdated: String = ""
    
    var radioButtonController: SSRadioButtonsController?
    
    @IBOutlet weak var Operational: UIButton!
    
    @IBOutlet weak var Parked: UIButton!
    
    @IBOutlet weak var ForSale: UIButton!
    
    @IBOutlet weak var Sold: UIButton!
    

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var recvMachId = "\(receivedMachineId)"
        var x = ["make" : "\(receivedMake)",
            "model" : "\(receivedModel)",
            "machineId" : "\(receivedMachineId)",
            "notes": "\(receivedNotes)",
            "status": "\(receivedStatus)",
            "machineState": "parked",
            "lastUpdated" : "\(lastUpdated)"
        ]

        var equipment = [recvMachId:  x]
        
        NSUserDefaults.standardUserDefaults().setObject(equipment, forKey: "equipment")
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)

//
        
//        if var retrievedDict = NSUserDefaults.standardUserDefaults().dictionaryForKey("equipment")  {
//            print(retrievedDict)
//            equipment[receivedMachineId]!["newKey"] = "newValue"
//            NSUserDefaults.standardUserDefaults().setObject(equipment, forKey: "equipment")
//            print(NSUserDefaults().dictionaryForKey("equipment") )// show dictionary
//        //}
  
//        NSUserDefaults.standardUserDefaults().setObject(equipment, forKey: "equipment")
//        if let dict = NSUserDefaults.standardUserDefaults().dictionaryForKey("equipment") {
//            
//            var myDict = dict
//            myDict["new_key"] = "new value"
//            NSUserDefaults.standardUserDefaults().setObject(myDict, forKey: "equipment")
//            let new = NSUserDefaults.standardUserDefaults().dictionaryForKey("equipment")
//            print(new)
//        }
        
        Operational.tag = 1
        Parked.tag = 2
        ForSale.tag = 3
        Sold.tag = 4
        
        
        radioButtonController = SSRadioButtonsController(buttons: Operational, Parked, ForSale, Sold)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = true
        
        
       // var radioButtonController = SSRadioButtonsController(buttons: button1, button2, button3)
        


        // Do any additional setup after loading the view.
    }
    
    func didSelectButton(aButton: UIButton?) {
       // let currentEquipment = NSUserDefaults.standardUserDefaults().objectForKey("equipment")
       // var tempEqup = currentEquipment![receivedMachineId]
        var radioButtons = ["1": "operational", "2": "parked", "3": "forsale", "4": "sold"]
        let tempOp = aButton?.tag
        let curentRadio = tempOp!
        if let retrievedDict = NSUserDefaults.standardUserDefaults().dictionaryForKey("equipment") as? Dictionary<String,Dictionary<String,String>> {
            
            var myDict = retrievedDict
            var newDict = myDict["\(receivedMachineId)"]
            let macState = radioButtons["\(curentRadio)"]!
        
            print(macState)
            newDict!["machineState"] = "\(macState)"


            myDict["\(receivedMachineId)"] = newDict
            NSUserDefaults.standardUserDefaults().setObject(myDict, forKey: "equipment")
            
            let now = NSUserDefaults.standardUserDefaults().dictionaryForKey("equipment")
            print("here")
            print(now)
            
        }
       
        print(aButton?.tag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let mapViewController: MapViewController = segue.destinationViewController as! MapViewController
        mapViewController.receivedMachineId = receivedMachineId
        
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
