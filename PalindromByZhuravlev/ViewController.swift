//
//  ViewController.swift
//  PalindromByZhuravlev
//
//  Created by Zhuravlev Lev on 06.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var answerStack: UIStackView!
    @IBOutlet weak var longestPoliLabel: UILabel!
    @IBOutlet weak var longestPoliCount: UILabel!
    var testText = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        textInput.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textInput.becomeFirstResponder()
    }
    
    // Main func which is find max-lenght polindrom
    func polindromLogic(_ str: String) -> String {
        
        // here we work with string
        // convert it in array
        guard str.count > 0 else { return "" }
        var s:[String] = []
        str.forEach{s.append(String($0.lowercased()))}
        
        
        var maxPolin = ""
        
        // here we make iteration's
        for i in 0...str.count {
            for j in i..<str.count {
                                
                var stringToCheck = ""
                for k in i...j {
                    stringToCheck += s[k]
                }
                
                // recoursive func which is cheking our current prestring
                // for polindrom
                if isPalindrome(stringToCheck) {
                    if maxPolin.count < stringToCheck.count {
                        maxPolin = stringToCheck
                    }
                }
            }
        }
        
        return maxPolin
    }
}

// recoursive func which is cheking string for polindrom
func isPalindrome(_ myString:String) -> Bool {
    let reverseString = String(myString.reversed())
    if(myString != "" && myString == reverseString) {
        return true
    } else {
        return false
    }
}



extension ViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        guard let inputText = textField.text else {
            return
        }
        
        let allText = inputText.split(separator: " ")
        var maxLenghtText = ""
        
        for string in allText {
            if string.count > maxLenghtText.count {
                let currentstring = polindromLogic(String(string))
                if maxLenghtText.count < currentstring.count {
                    maxLenghtText = currentstring
                }
            }
        }
        
        longestPoliLabel.text = maxLenghtText
        longestPoliCount.text = String(maxLenghtText.count)
    }
}
