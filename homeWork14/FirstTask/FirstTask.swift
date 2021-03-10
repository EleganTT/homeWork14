//
//  FirstTask.swift
//  homeWork14
//
//  Created by Dmitriy Lee on 01.03.2021.
//

import UIKit

class FirstTask: UIViewController {
    
    static let shared = FirstTask()
    private var kNameKey = "FirstTask.kNameKey"
    private var kSurNameKey = "FirstTask.kSurNameKey"
    
    var name: String? {
        set { UserDefaults.standard.set(newValue, forKey: "FirstTask.kNameKey")}
        get {return UserDefaults.standard.string(forKey: "FirstTask.kNameKey") }
    }
    
    var surName: String? {
        set { UserDefaults.standard.set(newValue, forKey: "FirstTask.kSurNameKey")}
        get {return UserDefaults.standard.string(forKey: "FirstTask.kSurNameKey") }
    }

    @IBOutlet weak var nameTextField: UITextField!

    
    @IBOutlet weak var surnameTextField: UITextField!
    

    @IBAction func saveButton(_ sender: Any) {
        FirstTask.shared.name = nameTextField.text
        FirstTask.shared.surName = surnameTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        resetDefaults()
        
        nameTextField.text = FirstTask.shared.name
        surnameTextField.text = FirstTask.shared.surName

    }
    
//    func resetDefaults() {
//        let defaults = UserDefaults.standard
//        let dictionary = defaults.dictionaryRepresentation()
//        dictionary.keys.forEach { key in
//            defaults.removeObject(forKey: key)
//        }
//    }

}
