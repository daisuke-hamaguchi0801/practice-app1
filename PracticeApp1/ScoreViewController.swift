//
//  ScoreViewController.swift
//  PracticeApp1
//
//  Created by 濱口大輔 on 2022/05/09.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    
    var correctCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "\(correctCount)問正解！"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toTopButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
