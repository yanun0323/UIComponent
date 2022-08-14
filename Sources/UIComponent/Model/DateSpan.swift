//
//  File.swift
//  
//
//  Created by YanunYang on 2022/8/14.
//


@available(iOS 15, macOS 12.0, *)
public enum DateSpan: CaseIterable, Codable {
    case None, Day, Week, Month, Year
}
