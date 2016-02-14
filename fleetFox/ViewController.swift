//
//  ViewController.swift
//  fleetFox
//
//  Created by Venkat Kotu on 2/10/16.
//  Copyright © 2016 VenkatKotu. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate{

    var cellContent = ["Report 1" , "Report 2", "Report 3"]
    

    @IBOutlet weak var make: UITextField!
    
    @IBOutlet weak var model: UITextField!
    
    
    @IBOutlet weak var lastUpdated: UITextField!
    @IBOutlet weak var machineId: UITextField!
    
    
    @IBOutlet weak var status: UITextField!
    
    @IBOutlet weak var notes: UITextField!
    
    var receivedMachineId : String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("helooooo")
        print(receivedMachineId)
        
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondVC: SecondViewController = segue.destinationViewController as! SecondViewController
        secondVC.receivedMake = make.text!
        secondVC.receivedModel = model.text!
        secondVC.receivedMachineId = machineId.text!
        secondVC.receivedNotes = notes.text!
        secondVC.receivedStatus = status.text!
        secondVC.lastUpdated = lastUpdated.text!
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 // if you want to have 3 sections in your table view
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = cellContent[indexPath.row]
        return cell
        
    }

}

