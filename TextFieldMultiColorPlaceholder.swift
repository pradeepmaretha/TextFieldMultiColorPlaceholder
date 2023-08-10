//
//  TextFieldMultiColorPlaceholder.swift
//  Test Task
//
//  Created by Pradeep Maretha on 10/08/23.
//

import Foundation
import UIKit
class TextFieldMultiColorPlaceholder:UITextField{
    
    @IBInspectable public var placeHolderColor: UIColor = UIColor.black
    @IBInspectable var isRequired:Bool = true{
        didSet{
            checkForRequired()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElement()
    }
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
        setupElement()
    }
    
    func setupElement(){
        
        let first:NSMutableAttributedString = NSMutableAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: placeHolderColor])
        let star = NSAttributedString(string: "*", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        let tmpStr : NSMutableAttributedString = first.mutableCopy() as! NSMutableAttributedString
        tmpStr.append(star)
        
        self.attributedPlaceholder = tmpStr
        
    }
    func checkForRequired(){
        if isRequired{
            setupElement()
        }else{
            self.attributedPlaceholder = NSMutableAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: placeHolderColor])
        }
    }
}
