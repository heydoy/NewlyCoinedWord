//
//  ViewController.swift
//  NewlyCoinedWord
//
//  Created by Doy Kim on 2022/07/08.
//

import UIKit

class SearchViewController: UIViewController {
    
    // properties
    var words: [String: String] = [
        "스불재" : "스스로 불러온 재앙",
        "삼귀다" : "아직 사귀는 사이가 아닌 썸타는 단계",
        "내또출" : "내일 또 출근의 줄임말",
        "꾸안꾸" : "꾸민듯 안 꾸민듯"
    ]
    
    var query: String = ""
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    // properties-hashtags
    
    @IBOutlet weak var firstHashtagButton: UIButton!
    @IBOutlet weak var secondHashtagButton: UIButton!
    @IBOutlet weak var thirdHashtagButton: UIButton!
    @IBOutlet weak var fourthHashtagButton: UIButton!
    
    
    
    
    var hashtags: [UIButton] {
        [firstHashtagButton, secondHashtagButton, thirdHashtagButton, fourthHashtagButton]
    }
    
    // lifecicyle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        query = searchTextField.text ?? ""
        designHashtag(for: hashtags)
        
        resultLabel.text = .none
        
    }
    
    @IBAction func didTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.query = text
    }
    
    
    @IBAction func didSearchButtonTapped(_ sender: UIButton) {
        setResultLabel(query)
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
     
    @IBAction func didHashTagTapped(_ sender: UIButton) {
        if let hashtag = sender.currentTitle {
            setResultLabel(hashtag)
        } else {
            setResultLabel("")
        }
        
    }
    
    func designHashtag(for buttons: [UIButton]){
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .white
        config.background.strokeWidth = 2.0
        config.background.strokeColor = .black
        config.background.backgroundColor = .white
        config.cornerStyle = .capsule
        
        buttons.forEach {
            print($0.currentTitle)
            // $0.clipsToBounds = true
            $0.setTitleColor(.black, for: .normal)
            $0.configuration = config
            $0.setTitle(words.keys.randomElement(), for: .normal)
            
        }
    }
    
    func setResultLabel(_ query: String) {
        if let result = words[query] {
            resultLabel.text = result
        } else {
            resultLabel.text = "검색결과가 없습니다."
        }
    }

}


extension SearchViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setResultLabel(query)
        textField.resignFirstResponder() // TextField 비활성화
        
        return true
    }
}
