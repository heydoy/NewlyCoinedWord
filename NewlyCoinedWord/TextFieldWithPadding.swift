//
//  TextFieldWithPadding.swift
//  NewlyCoinedWord
//
//  Created by Doy Kim on 2022/07/09.
//

import UIKit


class TextFieldWithPadding: UITextField {

    let textFieldPadding = UIEdgeInsets(
        top: 0,
        left: 18,
        bottom: 0,
        right: 18
    )
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        super.textRect(forBounds: bounds)
        return bounds.inset(by: textFieldPadding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        super.placeholderRect(forBounds: bounds)
        return bounds.inset(by: textFieldPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        super.editingRect(forBounds: bounds)
        return bounds.inset(by: textFieldPadding)
    }


}
