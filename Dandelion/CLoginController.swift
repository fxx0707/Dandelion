//
//  CLoginController.swift
//  Dandelion
//
//  Created by f on 16/3/20.
//  Copyright © 2016年 f. All rights reserved.
//

import Foundation
import UIKit

class CLoginController {
    
     func getBackgroundImage()->UIImage{
        let path = PathUtil.getResourcePath("bg_login", ofType: "jpg")
        let data = NSData(contentsOfFile: path!)
        let image = UIImage(data: data!)
        return image!
    }
    
}

enum VerticalAlignment{
    case Top,Middle,Bottom
}

struct BorderOption:OptionSetType {
    let rawValue:Int
    static let Top = BorderOption(rawValue: 1)
    static let Left = BorderOption(rawValue: 1<<1)
    static let Bottom = BorderOption(rawValue: 1<<2)
    static let Right = BorderOption(rawValue: 1<<3)
}

class BorderTextField: UITextField {
    var borderOption:BorderOption = BorderOption(rawValue: 0)
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        if borderOption.rawValue != 0{
            let current = UIGraphicsGetCurrentContext()
            if let cl = self.layer.borderColor{
                CGContextSetStrokeColorWithColor(current, cl)
            }
            CGContextSetLineWidth(current, 1)
            if borderOption.contains(.Top){
                CGContextMoveToPoint(current, 0, 1)
                CGContextAddLineToPoint(current, rect.size.width, 1)
            }
            
            if borderOption.contains(.Left){
                CGContextMoveToPoint(current, 0, 0)
                CGContextAddLineToPoint(current, 0, rect.size.height)
            }
            
            if borderOption.contains(.Bottom){
                CGContextMoveToPoint(current, 0, rect.size.height)
                CGContextAddLineToPoint(current, rect.size.width, rect.size.height)
            }
            
            if borderOption.contains(.Right){
                CGContextMoveToPoint(current, rect.size.width, 0)
                CGContextAddLineToPoint(current, rect.size.width, rect.size.height)
            }
            
            CGContextDrawPath(current, CGPathDrawingMode.Stroke)
            
        }
    }
}

class BorderLabel: UILabel {
    var verticalAlignment:VerticalAlignment = .Top {
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    var borderOption:BorderOption = BorderOption(rawValue: 0)
    
    override func drawTextInRect(rect: CGRect) {
        let newrect = self.computerRect(rect)
        super.drawTextInRect(newrect)
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        if borderOption.rawValue != 0{
            let current = UIGraphicsGetCurrentContext()
            if let cl = self.layer.borderColor{
                CGContextSetStrokeColorWithColor(current, cl)
            }
            if borderOption.contains(.Top){
                CGContextMoveToPoint(current, 0, 0)
                CGContextAddLineToPoint(current, rect.size.width, 0)
            }
            
            if borderOption.contains(.Left){
                CGContextMoveToPoint(current, 0, 0)
                CGContextAddLineToPoint(current, 0, rect.size.height)
            }
            
            if borderOption.contains(.Bottom){
                CGContextMoveToPoint(current, 0, rect.size.height)
                CGContextAddLineToPoint(current, rect.size.width, rect.size.height)
            }
            
            if borderOption.contains(.Right){
                CGContextMoveToPoint(current, rect.size.width, 0)
                CGContextAddLineToPoint(current, rect.size.width, rect.size.height)
            }
            
            CGContextDrawPath(current, CGPathDrawingMode.Stroke)
            
        }
    }
    
    private func computerRect(rect: CGRect)->CGRect{
        var newrect = super.textRectForBounds(rect, limitedToNumberOfLines: self.numberOfLines)
        switch self.verticalAlignment{
        case .Top:
            newrect.origin.y = rect.origin.y
            break
        case .Middle:
            newrect.origin.y = rect.origin.y + rect.size.height - (newrect.size.height/2)
            break
        case .Bottom:
            newrect.origin.y = rect.origin.y + rect.size.height - newrect.size.height
            break
        }
        return newrect
    }
}



class DandelionLayer:CAShapeLayer{
    
    override func drawInContext(ctx: CGContext) {
        super.drawInContext(ctx)
        let rgb = CGColorSpaceCreateDeviceRGB()
        var b:CGFloat = 1
        let gradient = CGGradientCreateWithColorComponents(rgb, [193/255,1,193/255,1.0,1,1,1,1.0], &b, 2)
        let x = CGRectGetMidX(self.bounds)
        let y = CGRectGetMidY(self.bounds)
        CGContextDrawRadialGradient(ctx, gradient, CGPointMake(x, y), 5, CGPointMake(x, y), 3, CGGradientDrawingOptions.DrawsAfterEndLocation)
        
        
    }
    //设置代理后，新增子类时会调用
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        super.drawLayer(layer, inContext: ctx)
    }
}

