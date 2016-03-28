//
//  HeadView.swift
//  Dandelion
//
//  Created by f on 16/3/22.
//  Copyright © 2016年 f. All rights reserved.
//

import UIKit

class HeadView: UIView {

    
    private var headImageView:UIImageView?
    private var accessoryImageView:UIImageView?
    var isShow = true {
        didSet{
            if isShow {
                accessoryImageView?.hidden = false
            }else{
                accessoryImageView?.hidden = true
            }
        }
    }
    
    var headImage:UIImage?{
        didSet{
            if headImage!.size.width<100 ||  headImage!.size.height<100{
                headImageView?.contentMode = .Center
            }else{
                headImageView?.contentMode = .ScaleToFill
            }
            headImageView?.image = headImage
        }
    }
    
    var accessoryImage:UIImage?{
        didSet{
            accessoryImageView?.image = accessoryImage
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let corner = max(self.frame.size.width,self.frame.size.height) / 2
        headImageView = UIImageView(frame: self.bounds)
        headImageView?.clipsToBounds=true
        //headImageView?.contentMode = .ScaleToFill
        headImageView?.layer.cornerRadius = corner
        headImageView?.layer.borderColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 0.8).CGColor
        headImageView?.layer.borderWidth = 1
        headImageView?.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 0.8)
        self.addSubview(headImageView!)
        
        let center = headImageView!.center
        let x = center.x + sin(45)*corner
        let y = center.y + cos(45)*corner
        
        accessoryImageView = UIImageView(frame: CGRectMake(0,0,30,30))
        accessoryImageView?.backgroundColor = UIColor.clearColor()
        accessoryImageView?.center = CGPoint(x: x, y: y)
        accessoryImageView?.layer.cornerRadius = 15
        accessoryImageView?.tintColor = UIColor(red: 0, green: 191/255, blue: 1, alpha: 1)
        self.addSubview(accessoryImageView!)
        
    }
    


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
