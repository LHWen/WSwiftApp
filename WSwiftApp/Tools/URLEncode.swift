//
//  URLEncode.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/31.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class URLEncode: NSObject {

    class func urlEncode(_ str: String) -> String {
        return str.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
    }
}
