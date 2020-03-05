//
//  CustomView.swift
//  Cov_in_Status_Bar
//
//  Created by yangyang on 2/23/20.
//  Copyright © 2020 yangyang. All rights reserved.
//

import Cocoa

class CustomView: NSView, LoadableView{
    
    // MARK: - IBOutlet Properties

    @IBOutlet weak var labelConfirmed: NSTextField!

    @IBOutlet weak var labelDead : NSTextField!
       
    @IBOutlet weak var labelRecovered : NSTextField!
    
    

    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        _ = load(fromNIBNamed: "CustomView")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
