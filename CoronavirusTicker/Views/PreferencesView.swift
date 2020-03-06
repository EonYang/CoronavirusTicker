//
//  CustomView.swift
//  Cov_in_Status_Bar
//
//  Created by yangyang on 2/23/20.
//  Copyright © 2020 yangyang. All rights reserved.
//

import Cocoa

class PreferencesView: NSView, Subview{
    
    // MARK: - IBOutlet Properties
    
    let appDelegate = NSApp.delegate as! AppDelegate
    
    @IBOutlet weak var regionsPopup: NSPopUpButtonCell!
    @IBOutlet weak var statusBarMode: NSPopUpButtonCell!
    @IBOutlet weak var updateIntervalPopup: NSPopUpButton!
    
    @IBAction func savePreference(_ sender: NSButton) {
        Config.setSelectedRegion(regionsPopup.titleOfSelectedItem)
        Config.setIconMode(statusBarMode.titleOfSelectedItem)
        Config.setUpdateInterval(updateIntervalPopup.titleOfSelectedItem)
        appDelegate.updateNumbers()
        appDelegate.updateStatusBarItem()
        self.window?.performClose(self)
    }

    @IBAction func CancelPressed(_ sender: NSButton) {
        self.window?.performClose(self)
    }
    
    func populateRegions() {
        regionsPopup.removeAllItems()
        for region in DataManager.regions {
            regionsPopup.addItem(withTitle: region)
        }
        guard let lastSelect = UserDefaults.standard.string(forKey: "RegionPreferenceString") else {return}
        regionsPopup.selectItem(withTitle: lastSelect)
    }
    
    func populateIntevals() {
        updateIntervalPopup.removeAllItems()
        for interval in Config.updateIntervalPossibleValues {
            updateIntervalPopup.addItem(withTitle: interval)
        }
        guard let lastSelect = UserDefaults.standard.string(forKey: "UpdateInterval") else {return}
        updateIntervalPopup.selectItem(withTitle: lastSelect)
    }
    
    func populateModes()  {
        statusBarMode.removeAllItems()
        for mode in Config.statusBarIconModePossibleValues {
            statusBarMode.addItem(withTitle: mode)
        }
        guard let lastSelect = UserDefaults.standard.string(forKey: "StatusBarIconMode") else {return}
        statusBarMode.selectItem(withTitle: lastSelect)
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        _ = load(fromNIBNamed: "PreferencesView")
        if load(fromNIBNamed: "PreferencesView") {
            populateRegions()
            populateModes()
            populateIntevals()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
