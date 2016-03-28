//
//  ForgetViewController.swift
//  Dandelion
//
//  Created by f on 16/3/21.
//  Copyright © 2016年 f. All rights reserved.
//

import UIKit

class ForgetViewController: UIViewController {
    
    var phoneTF:UITextField?
    var validateTF:UITextField?
    var passwordTF:UITextField?
    var validateBT:UIButton?
    var sureBT:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 1, alpha: 1)
        self.automaticallyAdjustsScrollViewInsets = false
        self.edgesForExtendedLayout = .None
        
        
        
        // Do any additional setup after loading the view.
        initSubView()
    }
    
    func initSubView(){
        
        let leftBT = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Reply, target: self, action: #selector(ForgetViewController.goBack))
        self.navigationItem.leftBarButtonItem = leftBT
        
        phoneTF = UITextField()
        phoneTF?.placeholder = "请输入手机号码"
        phoneTF?.keyboardType = .NumberPad
        phoneTF?.translatesAutoresizingMaskIntoConstraints=false
        phoneTF?.backgroundColor = UIColor.whiteColor()
        phoneTF?.clearButtonMode = .WhileEditing
        phoneTF?.layer.cornerRadius = 3
        phoneTF?.leftView = UIView(frame: CGRectMake(0,0,30,40))
        phoneTF?.leftViewMode = .Always
        phoneTF?.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.8).CGColor
        phoneTF?.layer.borderWidth=1
        //phoneTF?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        validateTF = UITextField()
        validateTF?.placeholder = "请输入验证码"
        validateTF?.autocorrectionType = .No
        validateTF?.autocapitalizationType = .None
        validateTF?.translatesAutoresizingMaskIntoConstraints=false
        validateTF?.keyboardType = .ASCIICapable
        validateTF?.backgroundColor = UIColor.whiteColor()
        validateTF?.layer.cornerRadius = 3
        validateTF?.clearButtonMode = .WhileEditing
        validateTF?.leftView = UIView(frame: CGRectMake(0,0,30,40))
        validateTF?.leftViewMode = .Always
        validateTF?.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.8).CGColor
        validateTF?.layer.borderWidth=1
        passwordTF = UITextField()
        passwordTF?.placeholder = "请输入密码"
        passwordTF?.secureTextEntry=true
        passwordTF?.translatesAutoresizingMaskIntoConstraints=false
        passwordTF?.backgroundColor = UIColor.whiteColor()
        passwordTF?.layer.cornerRadius = 3
        passwordTF?.clearButtonMode = .WhileEditing
        passwordTF?.leftView = UIView(frame: CGRectMake(0,0,30,40))
        passwordTF?.leftViewMode = .Always
        passwordTF?.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.8).CGColor
        passwordTF?.layer.borderWidth=1
        validateBT = UIButton()
        validateBT?.setTitle("获取验证码", forState: UIControlState.Normal)
        validateBT?.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        validateBT?.translatesAutoresizingMaskIntoConstraints=false
        validateBT?.backgroundColor = UIColor.whiteColor()
        validateBT?.layer.cornerRadius = 3
        validateBT?.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.8).CGColor
        validateBT?.layer.borderWidth=1
        
        sureBT = UIButton()
        sureBT?.setTitle("确定", forState: UIControlState.Normal)
        sureBT?.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        sureBT?.translatesAutoresizingMaskIntoConstraints=false
        sureBT?.backgroundColor = UIColor(red: 0, green: 191/255, blue: 1, alpha: 1)
        sureBT?.layer.cornerRadius = 3
        
        self.view.addSubview(phoneTF!)
        self.view.addSubview(validateTF!)
        self.view.addSubview(passwordTF!)
        self.view.addSubview(validateBT!)
        self.view.addSubview(sureBT!)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[phoneTF]-10-|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["phoneTF":phoneTF!]))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[validateTF]-10-[validateBT(==150)]-10-|", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["validateTF":validateTF!,"validateBT":validateBT!]))

        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[passwordTF]-10-|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["passwordTF":passwordTF!]))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[sureBT]-10-|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["sureBT":sureBT!]))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[phoneTF(==40)]-10-[validateTF(==40)]-10-[passwordTF(==40)]-10-[sureBT(==40)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["phoneTF":phoneTF!,"passwordTF":passwordTF!,"validateTF":validateTF!,"sureBT":sureBT!]))
        
        self.view.addConstraint(NSLayoutConstraint(item: validateTF!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: validateBT!, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        
    }
    
    func goBack(){
        self.view.endEditing(true)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
