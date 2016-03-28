//
//  PerfectViewController.swift
//  Dandelion
//
//  Created by f on 16/3/21.
//  Copyright © 2016年 f. All rights reserved.
//

import UIKit


class PerfectViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate{

    var contextView:UIView!
    var headImageView:HeadView?
    var imagePicker:UIImagePickerController?
    var scrollView:UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.whiteColor()
        self.view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 1, alpha: 1)
        //self.edgesForExtendedLayout = .None

        imagePicker=UIImagePickerController()
        imagePicker!.allowsEditing=true
        imagePicker!.delegate=self
       
        scrollView = UIScrollView(frame: CGRectZero)
        //scrollView.userInteractionEnabled=true
        scrollView.translatesAutoresizingMaskIntoConstraints=false
        let scrollViewClick = UITapGestureRecognizer(target: self, action: #selector(PerfectViewController.scrollViewClick))
        scrollView.addGestureRecognizer(scrollViewClick)
        self.view.addSubview(scrollView)
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[scrollView]-0-|", options: NSLayoutFormatOptions.DirectionMask, metrics: nil, views: ["scrollView":scrollView,"sview":self.view]))
        
         self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[scrollView]-0-|", options: NSLayoutFormatOptions.DirectionMask, metrics: nil, views: ["scrollView":scrollView,"sview":self.view]))
        
        contextView = UIView(frame: CGRectZero)
        contextView.userInteractionEnabled=true
        contextView.translatesAutoresizingMaskIntoConstraints=false
        scrollView.addSubview(contextView)
        
        
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[contextView(==scrollView)]-0-|", options: NSLayoutFormatOptions.DirectionMask, metrics: nil, views: ["contextView":contextView,"scrollView":scrollView]))
        
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[contextView]-0-|", options: NSLayoutFormatOptions.DirectionMask, metrics: nil, views: ["contextView":contextView,"scrollView":scrollView]))
        
        
        headImageView = HeadView(frame: CGRectMake(0,0,90,90))
        headImageView!.headImage = UIImage(named: "head_line")
        headImageView!.accessoryImage = UIImage(named: "camera")
        headImageView!.translatesAutoresizingMaskIntoConstraints=false
        let tap = UITapGestureRecognizer(target: self, action: #selector(PerfectViewController.imageSelectClick))
        headImageView!.addGestureRecognizer(tap)
        contextView.addSubview(headImageView!)
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[headImageView(==90)]", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["headImageView":headImageView!]))
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[headImageView(==90)]", options: NSLayoutFormatOptions.DirectionMask, metrics: nil, views: ["headImageView":headImageView!]))
        
        contextView.addConstraint( NSLayoutConstraint(item: headImageView!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: contextView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        
        let maleBT = UIButton(type: UIButtonType.Custom)
        maleBT.tag = 10000
        maleBT.translatesAutoresizingMaskIntoConstraints=false
        maleBT.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        maleBT.setTitleColor(UIColor.blackColor(), forState: UIControlState.Selected)
        maleBT.setImage(UIImage(named: "male"), forState: UIControlState.Normal)
        maleBT.setImage(UIImage(named: "male_selected"), forState: UIControlState.Selected)
        maleBT.setTitle("帅哥", forState: UIControlState.Normal)
        maleBT.addTarget(self, action: #selector(PerfectViewController.sexSelect(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        maleBT.contentMode = .Right
        maleBT.tintColor = UIColor.grayColor()
        contextView.addSubview(maleBT)
        
        let femaleBT = UIButton(type: UIButtonType.Custom)
        femaleBT.tag = 10001
        femaleBT.translatesAutoresizingMaskIntoConstraints=false
        femaleBT.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        femaleBT.setTitleColor(UIColor.blackColor(), forState: UIControlState.Selected)
        femaleBT.setImage(UIImage(named: "female"), forState: UIControlState.Normal)
        femaleBT.setImage(UIImage(named: "female_selected"), forState: UIControlState.Selected)
        femaleBT.setTitle("美女", forState: UIControlState.Normal)
        femaleBT.addTarget(self, action: #selector(PerfectViewController.sexSelect(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        contextView.addSubview(femaleBT)
        
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[maleBT(==90)]", options: NSLayoutFormatOptions.AlignAllTop, metrics: nil, views: ["maleBT":maleBT]))
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[femaleBT(==90)]", options: NSLayoutFormatOptions.AlignAllTop, metrics: nil, views: ["femaleBT":femaleBT]))
        
        contextView.addConstraint(NSLayoutConstraint(item: maleBT, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: femaleBT, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
        
        
        contextView.addConstraint(NSLayoutConstraint(item: maleBT, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: headImageView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: -50))
        
        contextView.addConstraint(NSLayoutConstraint(item: femaleBT, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: headImageView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 50))
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[headImageView(==90)]", options: NSLayoutFormatOptions.DirectionMask, metrics: nil, views: ["femaleBT":femaleBT,"headImageView":headImageView!]))
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[headImageView]-20-[maleBT(==50)]", options: NSLayoutFormatOptions.DirectionMask, metrics: nil, views: ["maleBT":maleBT,"headImageView":headImageView!]))
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[femaleBT(==50)]", options: NSLayoutFormatOptions.DirectionMask, metrics: nil, views: ["femaleBT":femaleBT]))
        
       
        let nicknameTF = UITextField()
        nicknameTF.autocorrectionType = .No
        nicknameTF.autocapitalizationType = .None
        nicknameTF.textAlignment = .Center
        nicknameTF.translatesAutoresizingMaskIntoConstraints=false
        nicknameTF.backgroundColor = UIColor.whiteColor()
        nicknameTF.placeholder = "请输入昵称"
        nicknameTF.layer.cornerRadius = 3
        nicknameTF.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.8).CGColor
        nicknameTF.layer.borderWidth=1
        contextView.addSubview(nicknameTF)
        let nameTF = UITextField()
        nameTF.autocorrectionType = .No
        nameTF.autocapitalizationType = .None
        nameTF.textAlignment = .Center
        nameTF.translatesAutoresizingMaskIntoConstraints=false
        nameTF.backgroundColor = UIColor.whiteColor()
        nameTF.placeholder = "请输入真实姓名"
        nameTF.layer.cornerRadius = 3
        nameTF.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.8).CGColor
        nameTF.layer.borderWidth=1
        nameTF.tag = 20000
        contextView.addSubview(nameTF)
        
        let constellationBT = UIButton(type: UIButtonType.Custom)
        constellationBT.translatesAutoresizingMaskIntoConstraints=false
        constellationBT.setTitle("星座", forState: UIControlState.Normal)
        constellationBT.setTitleColor(UIColor(red: 160/255, green: 32/255, blue: 240/255, alpha: 0.8), forState: UIControlState.Normal)
        constellationBT.backgroundColor = UIColor.whiteColor()
        constellationBT.layer.cornerRadius = 3
        constellationBT.layer.borderColor = UIColor(red: 160/255, green: 32/255, blue: 240/255, alpha: 0.8).CGColor
        constellationBT.layer.borderWidth=1
        constellationBT.addTarget(self, action: nil, forControlEvents: UIControlEvents.TouchUpInside)
        contextView.addSubview(constellationBT)
        
        let schoolBT = UIButton(type: UIButtonType.Custom)
        schoolBT.translatesAutoresizingMaskIntoConstraints=false
        schoolBT.setTitle("学校", forState: UIControlState.Normal)
        schoolBT.setTitleColor(UIColor(red: 255/255, green: 215/255, blue: 0/255, alpha: 0.8), forState: UIControlState.Normal)
        schoolBT.backgroundColor = UIColor.whiteColor()
        schoolBT.layer.cornerRadius = 3
        schoolBT.layer.borderColor = UIColor(red: 255/255, green: 215/255, blue: 0/255, alpha: 0.8).CGColor
        schoolBT.layer.borderWidth=1
        schoolBT.addTarget(self, action: nil, forControlEvents: UIControlEvents.TouchUpInside)
        contextView.addSubview(schoolBT)
        
        let gradeBT = UIButton(type: UIButtonType.Custom)
        gradeBT.translatesAutoresizingMaskIntoConstraints=false
        gradeBT.setTitle("年级", forState: UIControlState.Normal)
        gradeBT.setTitleColor(UIColor(red: 0/255, green: 191/255, blue: 255/255, alpha: 0.8), forState: UIControlState.Normal)
        gradeBT.backgroundColor = UIColor.whiteColor()
        gradeBT.layer.cornerRadius = 3
        gradeBT.layer.borderColor = UIColor(red: 0/255, green: 191/255, blue: 255/255, alpha: 0.8).CGColor
        gradeBT.layer.borderWidth=1
        gradeBT.addTarget(self, action: nil, forControlEvents: UIControlEvents.TouchUpInside)
        contextView.addSubview(gradeBT)
        
        let interestBT = UIButton(type: UIButtonType.Custom)
        interestBT.translatesAutoresizingMaskIntoConstraints=false
        interestBT.setTitle("兴趣", forState: UIControlState.Normal)
        interestBT.setTitleColor(UIColor(red: 255/255, green: 106/255, blue: 106/255, alpha: 0.8), forState: UIControlState.Normal)
        interestBT.backgroundColor = UIColor.whiteColor()
        interestBT.layer.cornerRadius = 3
        interestBT.layer.borderColor = UIColor(red: 255/255, green: 106/255, blue: 106/255, alpha: 0.8).CGColor
        interestBT.layer.borderWidth=1
        interestBT.addTarget(self, action: nil, forControlEvents: UIControlEvents.TouchUpInside)
        contextView.addSubview(interestBT)
        
        
        let sureBT = UIButton()
        sureBT.setTitle("确定", forState: UIControlState.Normal)
        sureBT.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        sureBT.translatesAutoresizingMaskIntoConstraints=false
        sureBT.backgroundColor = UIColor(red: 0, green: 191/255, blue: 1, alpha: 1)
        sureBT.layer.cornerRadius = 3
        contextView.addSubview(sureBT)
        
        
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[nicknameTF]-10-|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["nicknameTF":nicknameTF]))
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[nameTF]-10-|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["nameTF":nameTF]))
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[constellationBT]-10-|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["constellationBT":constellationBT]))
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[schoolBT]-10-|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["schoolBT":schoolBT]))
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[gradeBT]-10-|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["gradeBT":gradeBT]))
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[interestBT]-10-|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["interestBT":interestBT]))
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[sureBT]-10-|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["sureBT":sureBT]))
        
        
        
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[femaleBT]-10-[nicknameTF(==40)]", options: NSLayoutFormatOptions.DirectionMask, metrics: nil, views: ["nicknameTF":nicknameTF,"femaleBT":femaleBT]))
        
        contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[nicknameTF]-10-[nameTF(==40)]-10-[constellationBT(==40)]-10-[schoolBT(==40)]-10-[gradeBT(==40)]-10-[interestBT(==40)]-10-[sureBT(==40)]-(>=10)-|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: ["nicknameTF":nicknameTF,"nameTF":nameTF,"constellationBT":constellationBT,"schoolBT":schoolBT,"gradeBT":gradeBT,"interestBT":interestBT,"sureBT":sureBT]))
        
       

        // Do any additional setup after loading the view.
    }
    
    /*
 
    */

    func imageSelectClick(){
        print("设置头像")
        
        if #available(iOS 8.3, *){
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
            actionSheet.addAction( UIAlertAction(title: "拍照", style: .Default, handler: { (alert) in
                
                if UIImagePickerController.isSourceTypeAvailable(.Camera){
                    self.imagePicker?.sourceType = .Camera
                    self.presentViewController(self.imagePicker!, animated: true, completion: nil)
                }
            
            }))
            
            actionSheet.addAction( UIAlertAction(title: "从相册中选择", style: .Default, handler: { (alert) in
                
                if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
                    self.imagePicker?.sourceType = .PhotoLibrary
                    self.presentViewController(self.imagePicker!, animated: true, completion: nil)
                }
                
            }))
            
            actionSheet.addAction( UIAlertAction(title: "取消", style: .Cancel, handler: { (alert) in
                
            }))
            self.presentViewController(actionSheet, animated: true, completion: nil)
            
        }else{
            
            let actionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "拍照", "从相册中选择")
            actionSheet.showInView(self.view)
            
        }

    }
 
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        var bln = true;
        switch buttonIndex {
        case 1:
            if UIImagePickerController.isSourceTypeAvailable(.Camera){
                self.imagePicker?.sourceType = .Camera
            }else{
                bln = false
            }
            break
        case 2:
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
                self.imagePicker?.sourceType = .PhotoLibrary
            }else{
                bln = false
            }
            break
        default: break
            
        }
        
        if buttonIndex != 0 && bln{
            self.presentViewController(self.imagePicker!, animated: true, completion: nil)
        }
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("选择图片")
        print(info[UIImagePickerControllerMediaType])
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        headImageView?.headImage = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    
    
    
    func sexSelect(sender:UIButton){
        print("性别")
        sender.selected = true
        switch sender.tag{
        case 10000:
            (contextView.viewWithTag(10001) as! UIButton).selected=false
            break
        case 10001:
            (contextView.viewWithTag(10000) as! UIButton).selected=false
            break
        default: break
            
        }
    }
    
    /*-------------------------键盘通知----------------------------*/
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(PerfectViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(PerfectViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification:NSNotification){
       let rect = notification.userInfo![UIKeyboardFrameEndUserInfoKey]!.CGRectValue()
       
       let textfield = (contextView.viewWithTag(20000) as! UITextField)
        
       let converRect =  textfield.convertRect(textfield.bounds, toView: self.view)
        let y =  self.view.bounds.height - (CGRectGetMaxY(converRect) + rect.size.height)
        
        if y < 0{
            
            self.scrollView.contentOffset = CGPoint(x: 0,y: self.scrollView.contentOffset.y+1-y)
        }
        
        
    }
    func keyboardWillHide(notification:NSNotification){
        let rect = notification.userInfo![UIKeyboardFrameBeginUserInfoKey]!.CGRectValue()
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey]!.doubleValue
        print(rect)
    }

    
    func scrollViewClick(){
        self.view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
