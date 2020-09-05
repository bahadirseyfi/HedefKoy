//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by bahadir on 4.09.2020.
//  Copyright © 2020 Bahadır Seyfi. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTextField.delegate = self
    }
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        //    Pass Data into Core Data Goal Model
        if pointsTextField.text != "" {
        self.save { (complete) in
            if complete {
                dismiss(animated: true, completion: nil)
            }
        }
        }
    }
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            print("Veriler Başarıyla Kaydedildi!")
            completion(true)
            
        } catch {
            debugPrint("Could not: \(error.localizedDescription)")
            completion(false)
        }
        
    }

}
