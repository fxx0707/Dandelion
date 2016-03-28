//
//  LoginController.swift
//  Dandelion
//
//  Created by f on 16/3/20.
//  Copyright © 2016年 f. All rights reserved.
//

import UIKit

class LoginController: UIViewController,UITextFieldDelegate{
    var cloginController:CLoginController?
    var usernameTF:UITextField?
    var passwordTF:BorderTextField?
    var loginBT:UIButton?
    var viewYConstraint:NSLayoutConstraint?
    var loginView:UIView?
    var registerViewController:RegisterViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        cloginController =  CLoginController()
        self.view.backgroundColor = UIColor(patternImage: cloginController!.getBackgroundImage())
        
        //self.view.backgroundColor = UIColor(red: 0, green: 191/255, blue: 1, alpha: 1)
        
        let backgroundLayer = CAShapeLayer()
        backgroundLayer.frame = self.view.bounds
        backgroundLayer.backgroundColor = UIColor(white: 0.5, alpha: 0.5).CGColor
        self.view.layer.addSublayer(backgroundLayer)
        
        
        initSubView()
        
        //et imageview = UIImageView(frame: self.view.bounds)
        //imageview.image = cloginController!.getBackgroundImage()
        //self.view.addSubview(imageview)
        
        // Do any additional setup after loading the view.
    }
    
   
    
    func initSubView(){
        initLoginView()
        
        let forgetpassword = UIButton(type: UIButtonType.Custom)
        forgetpassword.setTitle("忘记密码", forState: UIControlState.Normal)
        forgetpassword.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        forgetpassword.translatesAutoresizingMaskIntoConstraints=false
        forgetpassword.titleLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        forgetpassword.titleLabel?.textAlignment = .Left
        forgetpassword.contentMode = .Left
        forgetpassword.addTarget(self, action: #selector(LoginController.forgetClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(forgetpassword)
        
        let register = UIButton(type: UIButtonType.Custom)
        register.setTitle("新用户注册", forState: UIControlState.Normal)
        register.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        register.translatesAutoresizingMaskIntoConstraints=false
        register.titleLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        register.contentMode = .Right
        register.addTarget(self, action: #selector(LoginController.registerClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(register)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[forgetpassword(==90)]", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: ["forgetpassword":forgetpassword]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[forgetpassword(==30)]-20-|", options: NSLayoutFormatOptions.AlignAllBottom, metrics: nil, views: ["forgetpassword":forgetpassword]))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[register(==90)]-10-|", options: NSLayoutFormatOptions.AlignAllRight, metrics: nil, views: ["register":register]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[register(==30)]-20-|", options: NSLayoutFormatOptions.AlignAllBottom, metrics: nil, views: ["register":register]))
        
    }
    
    
    func initLoginView(){
        
        
        
        let titleImageView = UIImageView()
        titleImageView.backgroundColor = UIColor.yellowColor()
        titleImageView.translatesAutoresizingMaskIntoConstraints=false
        self.view.addSubview(titleImageView)
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[titleImageView(==50)]", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["titleImageView":titleImageView]))
        self.view.addConstraint( NSLayoutConstraint(item: titleImageView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        let titleLB = UILabel(frame: CGRectZero)
        titleLB.translatesAutoresizingMaskIntoConstraints=false
        titleLB.textAlignment = .Center
        titleLB.textColor = UIColor.whiteColor()
        titleLB.contentMode = .Center
        let attribute = NSMutableAttributedString(string: "蒲公英          你的专属社交网络")
        attribute.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(22), range: NSRange(location: 0, length: 3))
        attribute.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(13), range: NSRange(location: 3, length: attribute.string.characters.count-3))
        attribute.addAttribute(NSStrikethroughStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: NSRange(location: 4, length: 7))
        attribute.addAttribute(NSBaselineOffsetAttributeName, value:2.5, range: NSRange(location: 12, length: attribute.string.characters.count-12))
        titleLB.attributedText = attribute
        self.view.addSubview(titleLB)
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[titleLB(==300)]", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["titleLB":titleLB]))
        self.view.addConstraint( NSLayoutConstraint(item: titleLB, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        
        let headheight:CGFloat = 30
        let textfieldheight:CGFloat = 35
        
        loginView = UIView(frame: CGRectMake(0,0,300,135))
        loginView?.translatesAutoresizingMaskIntoConstraints=false
        loginView?.backgroundColor = UIColor.clearColor()
        loginView?.layer.cornerRadius = 5
        loginView?.clipsToBounds=true
        self.view.addSubview(loginView!)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[view(==300)]", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["view":loginView!]))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[view(==135)]", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: nil, views: ["view":loginView!,"titleLB":titleLB]))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[titleLB]-20-[view]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view":loginView!,"titleLB":titleLB]))
        
         self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[titleImageView(==50)]-10-[titleLB]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["titleImageView":titleImageView,"titleLB":titleLB]))
        
        self.view.addConstraint( NSLayoutConstraint(item: loginView!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        viewYConstraint = NSLayoutConstraint(item: loginView!, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        self.view.addConstraint(viewYConstraint!)
        
        
        let layerHead = CAShapeLayer()
        layerHead.frame = CGRectMake(0, 0, loginView!.frame.size.width, headheight)
        layerHead.backgroundColor = UIColor(white: 1, alpha: 0.5).CGColor
        loginView?.layer.addSublayer(layerHead)
        let dandelionLayer = DandelionLayer()
        dandelionLayer.frame = CGRectMake(0, 0, 30, 30)
        layerHead.addSublayer(dandelionLayer)
        dandelionLayer.setNeedsDisplay()
        
        let layerContent = CAShapeLayer()
        layerContent.frame = CGRectMake(0, layerHead.frame.size.height , loginView!.frame.size.width, loginView!.frame.size.height - layerHead.frame.size.height)
        layerContent.backgroundColor = UIColor.whiteColor().CGColor
        
        loginView?.layer.addSublayer(layerContent)
        
        
        usernameTF = UITextField(frame: CGRectMake(0,headheight,loginView!.frame.size.width,textfieldheight))
        usernameTF?.tag = 10000
        usernameTF?.placeholder="请输入账号"
        usernameTF?.textAlignment = .Center
        usernameTF?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        usernameTF?.autocorrectionType = .No
        usernameTF?.autocapitalizationType = .None
        usernameTF?.enablesReturnKeyAutomatically = true
        usernameTF?.keyboardType = .ASCIICapable
        usernameTF?.returnKeyType = .Next
        usernameTF?.delegate = self
        usernameTF?.addTarget(self, action: #selector(LoginController.textFieldChange), forControlEvents: UIControlEvents.EditingChanged)
        usernameTF?.clearButtonMode = .WhileEditing
        passwordTF = BorderTextField(frame: CGRectMake(0,headheight+textfieldheight,loginView!.frame.size.width,textfieldheight))
        passwordTF?.autocapitalizationType = .None
        passwordTF?.autocorrectionType = .No
        passwordTF?.secureTextEntry=true
        passwordTF?.placeholder="请输入密码"
        passwordTF?.textAlignment = .Center
        passwordTF?.layer.borderColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 0.8).CGColor
        passwordTF?.borderOption = [.Top,.Bottom]
        passwordTF?.enablesReturnKeyAutomatically=true
        passwordTF?.returnKeyType = .Go
        passwordTF?.delegate = self
        passwordTF?.tag = 10001
        passwordTF?.addTarget(self, action: #selector(LoginController.textFieldChange), forControlEvents: UIControlEvents.EditingChanged)
        passwordTF?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        passwordTF?.clearButtonMode = .WhileEditing
        loginView!.addSubview(usernameTF!)
        loginView!.addSubview(passwordTF!)
        
        loginBT = UIButton(type: UIButtonType.Custom)
        loginBT?.frame = CGRectMake(0, headheight+textfieldheight*2, loginView!.frame.size.width, textfieldheight)
        loginBT?.setTitle("登陆", forState: UIControlState.Normal)
        loginBT?.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        loginBT?.titleLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        loginBT?.addTarget(self, action: #selector(LoginController.loginClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        loginBT?.setTitleColor(UIColor.grayColor(), forState: UIControlState.Disabled)
        loginBT?.enabled=false
        loginView!.addSubview(loginBT!)
    }
    
    
    func loginClick(sender:UIButton){
        self.view.endEditing(true)
        NSObject.cancelPreviousPerformRequestsWithTarget(self, selector: #selector(LoginController.login), object: sender)
        self.performSelector(#selector(LoginController.login), withObject: sender, afterDelay: 0.25)
    }

    func login(){
         print("登陆")
    
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.tag == 10000{
            self.passwordTF?.becomeFirstResponder()
        }else if textField.tag == 10001{
            self.passwordTF?.resignFirstResponder()
        }
        return true
    }
    
    func textFieldChange(){
        if self.usernameTF!.text!.isEmpty || self.passwordTF!.text!.isEmpty{
            self.loginBT?.enabled=false
            passwordTF?.enablesReturnKeyAutomatically=true
        }else{
            self.loginBT?.enabled=true
            passwordTF?.enablesReturnKeyAutomatically=false
        }
    }
    
    func registerClick(sender:UIButton){
        print("注册")
        if registerViewController == nil{
            registerViewController = RegisterViewController()

        }
        registerViewController?.title = "注册账号"
        let registNG = UINavigationController(rootViewController: registerViewController!)
        self.presentViewController(registNG, animated: true, completion: nil)
    }
    
    func forgetClick(sender:UIButton){
        print("忘记密码")
        
        
        let forget = ForgetViewController()
        forget.title = "密码重置"
        let forgetNG = UINavigationController(rootViewController: forget)
        self.presentViewController(forgetNG, animated: true, completion: nil)
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginController.keyboardShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginController.keyboardHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardShow(notification:NSNotification){
       let rect = notification.userInfo![UIKeyboardFrameEndUserInfoKey]!.CGRectValue
       let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey]!.doubleValue
       let height = CGRectGetMaxY(loginView!.frame) + rect.height - self.view.frame.size.height
        if height > 0{
           UIView.animateWithDuration(duration, animations: { () -> Void in
            self.viewYConstraint?.constant = -height
           })
           
        }
    }
    
    func keyboardHide(notification:NSNotification){
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey]!.doubleValue
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.viewYConstraint?.constant = 0
        })
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
