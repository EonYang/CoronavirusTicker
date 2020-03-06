//
//  ViewController.swift
//  CoronavirusTicker
//
//  Created by yangyang on 3/4/20.
//  Copyright © 2020 yangyang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewWillAppear() {
        super.viewWillAppear()
        view.window?.styleMask.remove(.resizable)
        view.window?.styleMask.remove(.miniaturizable)
        view.window?.center()
        view.window?.level = .floating
        let preferencesView = PreferencesView(frame: self.view.bounds)
        preferencesView.insertTo(toView: self.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

