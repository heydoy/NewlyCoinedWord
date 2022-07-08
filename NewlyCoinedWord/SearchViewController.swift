//
//  ViewController.swift
//  NewlyCoinedWord
//
//  Created by Doy Kim on 2022/07/08.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: -  properties
    var words: [String: String] = [
        "스불재" : "스스로 불러온 재앙",
        "삼귀다" : "아직 사귀는 사이가 아닌 썸타는 단계",
        "내또출" : "내일 또 출근의 줄임말",
        "꾸안꾸" : "꾸민듯 안 꾸민듯",
        "윰차"  : "유무차별",
        "저메추" : "저녁메뉴추천",
        "슬세권" : "슬리퍼처럼 편한 복장으로 다닐 수 있는 범위의 생활권역",
        "미닝아웃" : "Meaning+Coming Out의 합성어, 비활동에 자신의 취향과 신념을 적극적으로 표현하는 소비 습관",
        "털개버세": "털리면 개미, 버티면 세력"
        
        
    ]
    
    var query: String = ""
    
    @IBOutlet weak var searchTextField: TextFieldWithPadding!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    // properties-hashtags
    
    @IBOutlet weak var firstHashtagButton: UIButton!
    @IBOutlet weak var secondHashtagButton: UIButton!
    @IBOutlet weak var thirdHashtagButton: UIButton!
    @IBOutlet weak var fourthHashtagButton: UIButton!
    
    
    var hashtags: [UIButton] {
        [firstHashtagButton, secondHashtagButton, thirdHashtagButton, fourthHashtagButton]
    }
    
    //MARK: - lifecicyle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        query = searchTextField.text ?? ""
        searchTextField.placeholder = "검색할 신조어를 입력하세요"
        resultLabel.text = .none
        designHashtag(for: hashtags)
        
        setTextfieldPadding(searchTextField)
        
                
    }
    
    //MARK: -  actions
    
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
        if let hashtag = sender.currentTitle{
            setResultLabel(hashtag)
        } else {
            setResultLabel("")
        }
        
    }
    
    //MARK: -  helpers
    
    func designHashtag(for buttons: [UIButton]){
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .white
        config.background.strokeWidth = 2.0
        config.background.strokeColor = .black
        config.background.backgroundColor = .white
        config.cornerStyle = .capsule
        
        buttons.forEach {
            $0.setTitleColor(.black, for: .normal)
            $0.configuration = config
            $0.setTitle(words.keys.randomElement(), for: .normal)
            
            // 단어가 안 겹치게 랜덤으로 픽할 순 없을까
        }

        
    }
    
    func setResultLabel(_ query: String) {
        if let result = words[query] {
            resultLabel.text = result
        } else {
            resultLabel.text = "검색결과가 없습니다."
        }
    }
    
    func setTextfieldPadding(_ tf: UITextField) {
        let textFieldPadding = UIEdgeInsets(
            top: 0,
            left: 18,
            bottom: 0,
            right: 18
        )
        tf.textRect(forBounds: tf.bounds).inset(by: textFieldPadding)
        tf.placeholderRect(forBounds: tf.bounds).inset(by: textFieldPadding)
        tf.editingRect(forBounds: tf.bounds).inset(by: textFieldPadding)
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

