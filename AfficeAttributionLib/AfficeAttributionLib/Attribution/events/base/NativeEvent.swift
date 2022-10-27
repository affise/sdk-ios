//
//  NativeEvent.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation

@objc
public class NativeEvent : Event {
    override func getCategory() -> String {
        "native"
    }
}
