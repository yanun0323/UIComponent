//
//  File.swift
//  
//
//  Created by YanunYang on 2022/7/30.
//

import Foundation

@available(iOS 15, macOS 12.0, *)
public typealias DateFormatLayout = String

@available(iOS 15, macOS 12.0, *)
public extension DateFormatLayout {
    init(_ layout: String) {
        self = layout
    }
    /**
    2006-01-02 15:04:05 +0800
    */
    static let Default: Self = "yyyy-MM-dd HH:mm:ss Z"
    /**
    Mon Jan 02 15:04:05 2006
    */
    static let ANSIC: Self = "EE MMM dd HH:mm:ss yyyy"
    /**
    Mon Jan 02 15:04:05 +0800 2006
    */
    static let UnixDate: Self = "EE MMM dd HH:mm:ss Z yyyy"
    /**
    02 Jan 06 15:04 +0800
    */
    static let RFC822: Self = "dd MMM yy HH:mm Z"
    /**
    Mon, 02 Jan 2006 15:04:05 +0800
    */
    static let RFC1123: Self = "EE, dd MMM yyyy HH:mm:ss Z"
    /**
    Jan 02 15:04:05
    */
    static let Stamp: Self = "MMM dd HH:mm:ss"
    /**
    2006-01-02
    */
    static let Date: Self = "yyyy-MM-dd"
    /**
     20060102
     */
    static let Numeric: Self = "yyyyMMdd"
}
