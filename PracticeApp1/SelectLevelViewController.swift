//
//  SelectLevelViewController.swift
//  PracticeApp1
//
//  Created by 濱口大輔 on 2022/05/15.
//

import UIKit

class SelectLevelViewController: UIViewController {
    @IBOutlet weak var level1Button: UIButton!
    @IBOutlet weak var level2Button: UIButton!
    @IBOutlet weak var level3Button: UIButton!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var callAPIButton: UIButton!
    
    var selectTag = 0
    var isButtonEnabled = true
    var level2ButtonColor = UIColor.init()
    var level3ButtonColor = UIColor.init()
    
    var enableButtonTitle = "レベル2,3を活性化"
    var disableButtonTitle = "レベル2,3非活性化"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        level1Button.layer.borderWidth = 2
        level1Button.layer.borderColor = UIColor.black.cgColor
        level2Button.layer.borderWidth = 2
        level2Button.layer.borderColor = UIColor.black.cgColor
        level2ButtonColor = level2Button.backgroundColor!
        level3Button.layer.borderWidth = 2
        level3Button.layer.borderColor = UIColor.black.cgColor
        level3ButtonColor = level3Button.backgroundColor!
        toggleButton.setTitle(disableButtonTitle, for: .normal)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizVC = segue.destination as! QuizViewController
        quizVC.selectLevel = selectTag
    }
    
    @IBAction func levelButtonAction(sender: UIButton){
        print(sender.tag)
        selectTag = sender.tag
        performSegue(withIdentifier: "toQuizVC", sender: nil)
    }

    @IBAction func toggleButtonAction(_ sender: Any) {
            self.isButtonEnabled.toggle()
            level2Button.isEnabled.toggle()
            level3Button.isEnabled.toggle()
        if isButtonEnabled {
            level2Button.backgroundColor = level2ButtonColor
            level3Button.backgroundColor = level3ButtonColor
            toggleButton.setTitle(disableButtonTitle, for: .normal)
        }else{
            level2Button.backgroundColor = UIColor.gray
            level3Button.backgroundColor = UIColor.gray
            toggleButton.setTitle(enableButtonTitle, for: .normal)
        }
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func callAPIButtonAction(_ sender: Any) {
        let urlString = "https://klnapp.azurewebsites.net/test/"
        let url = URL(string: urlString)!  //URLを生成
        let request = URLRequest(url: url)               //Requestを生成
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in  //非同期で通信を行う
            guard let data = data else { return }
            let apiCallSuccessMessage = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
            DispatchQueue.main.async {
                self.callAPIButton.setTitle(apiCallSuccessMessage + "\n" + urlString as String, for: .normal)
            }
        }
 
        task.resume()
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
