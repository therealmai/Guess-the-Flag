//
//  ViewController.swift
//  Guess the Flag
//
//  Created by Jomar Leano on 10/7/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionNumberLabel: UILabel!
    
    var countries = [String]();
    var correctAnswer = 0
    var score = 0;
    var number = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion(action: nil);
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        number += 1;
        
        if(number > 10){
            showResult()
            return
        }
        updateTitles()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String?
        if(sender.tag == correctAnswer){
            title = "Correct"
            score += 1
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
                
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                
            present(ac, animated: true);
        }else{
            title = "Wrong"
            let ac = UIAlertController(title: title, message: "Wrong! That's the flag of \(countries[sender.tag].capitalized)", preferredStyle: .alert)
                
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                
            present(ac, animated: true);
        }
    }
    
    func updateTitles(){
        title = countries[correctAnswer].uppercased()
        scoreLabel.text = "Score: \(score)"
        questionNumberLabel.text = "Number: \(number)/10"
    }
    
    func showResult(){
        let sc = UIAlertController(title: "End of the game", message: "Your score is \(score)", preferredStyle: .alert)
        sc.addAction(UIAlertAction(title: "Restart Game", style: .default, handler: askQuestion))
        present(sc,animated: true);
        score = 0
        number = 0
        correctAnswer = 0
    }
    
}


