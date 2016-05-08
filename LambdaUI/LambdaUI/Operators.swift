//
//  Operators.swift
//  LambdaUI
//
//  Created by Mislav Javor on 06/05/16.
//  Copyright © 2016 Mislav Javor. All rights reserved.
//

import Foundation

public func += <TType,TReturn>(inout left: [LDAEvent<TType, TReturn>], right: (TType, UIEvent) -> TReturn) -> String {
    let newEvent = LDAEvent<TType, TReturn>(eventFunction: right)
    left.append(newEvent)
    return newEvent.uuid
}

public func -= <TType, TReturn>(inout left: [LDAEvent<TType, TReturn>], right: String) -> Bool{
    for item in left.enumerate() {
        if item.element.uuid == right {
            left.removeAtIndex(item.index)
            return true
        }
    }
    return false
}

public func += <TType, TReturn>(inout left: [LDAEvent<TType, TReturn>], right: async<TType, TReturn>) -> String {
    let newEvent = LDAEvent<TType, TReturn>(shouldAsync: true, queue: right.queue, eventFunction: right.eventFunction)
    left.append(newEvent)
    return newEvent.uuid
}