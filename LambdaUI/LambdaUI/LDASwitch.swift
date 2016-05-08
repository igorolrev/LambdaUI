//
//  LDASwitch.swift
//  LambdaUI
//
//  Created by Mislav Javor on 08/05/16.
//  Copyright © 2016 Mislav Javor. All rights reserved.
//

import Foundation

@IBDesignable
public class LDASwitch : UISwitch {
    
    public var events : LDAControlHandler<UISwitch>!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addEventsToLambda()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addEventsToLambda()
    }
    
    private func addEventsToLambda() {
        events = LDAControlHandler(control: self)
    }
    
}