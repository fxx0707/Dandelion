//
//  PathUtil.swift
//  Dandelion
//
//  Created by f on 16/3/20.
//  Copyright © 2016年 f. All rights reserved.
//

import Foundation

class PathUtil{
    
    class func getResourcePath(name:String,ofType:String?)->String?{
        let path = NSBundle.mainBundle().pathForResource(name, ofType: ofType)
        return path
    }
    
}