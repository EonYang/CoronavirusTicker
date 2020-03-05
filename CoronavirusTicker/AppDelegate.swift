//
//  AppDelegate.swift
//  Cov_in_Status_Bar
//
//  Created by yangyang on 2/23/20.
//  Copyright © 2020 yangyang. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var menu: NSMenu?
    @IBOutlet weak var firstMenuItem: NSMenuItem?
    @IBOutlet weak var secondMenuItem: NSMenuItem?
    
    var statusItem: NSStatusItem?
    var customView: CustomView?
    
    @IBAction func showPreferences(_ sender: Any) {
        
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: .init(stringLiteral: "PreferencesID")) as? ViewController else {
            return
        }
        
        let window = NSWindow(contentViewController: vc)
        window.makeKeyAndOrderFront(nil)
    }
    
    func updateStatusBarItem()  {
        DispatchQueue.main.async {
            if self.statusItem != nil {
                self.statusItem?.button?.removeFromSuperview()
            }
            self.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
            
            
            if ["Icon Only", "Both"].contains(Config.statusBarIconMode) {
                let itemImage = NSImage(named: "status_bar_icon")
                itemImage?.isTemplate = true
                self.statusItem?.button?.image = itemImage
                self.statusItem?.button?.imagePosition = NSControl.ImagePosition.imageLeft
            }
            
            if ["Number Only", "Both"].contains(Config.statusBarIconMode) {
                self.statusItem?.button?.title = DataManager.lastConfirmed!
            }
            
            
            if let menu = self.menu {
                self.statusItem?.menu = menu
                menu.delegate = self
            }
            
            if let item = self.firstMenuItem {
                item.view = self.customView
            }
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customView = CustomView(frame: NSRect(x: 0.0, y: 0.0, width: 240.0, height: 120.0))
        Config.initUserDefaults()
        updateStatusBarItem()
        Timer.scheduledTimer(withTimeInterval: TimeInterval(Config.updateInterval), repeats: true) { timer in
            print("auto refresh")
            self.updateNumbers ()
        }
        updateNumbers ()
        DataManager.getRegions()
    }
    
    func updateNumbers () {
        DispatchQueue.main.async {
            self.secondMenuItem?.title = "updating..."
        }
        DataManager.getSum(url: Config.urlConfirmed!, completionHandeler: { result, date in
            DataManager.setNumber(self.customView?.labelConfirmed, result)
            DataManager.setLastUpdateDate(date, self.secondMenuItem)
            DataManager.lastConfirmed = String(result!)
            if ["Number Only", "Both"].contains(Config.statusBarIconMode) {
                DispatchQueue.main.async {
                    self.statusItem?.button?.title = DataManager.lastConfirmed!
                }
            }
        })
        DataManager.getSum(url: Config.urlDead!, completionHandeler: { result, date in
            DataManager.setNumber(self.customView?.labelDead, result)
        })
        DataManager.getSum(url: Config.urlRecovered!, completionHandeler: { result , date in
            DataManager.setNumber(self.customView?.labelRecovered, result)
        })
    }
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {

    }
    
    
    func applicationWillTerminate(_ aNotification: Notification) {}
    
    
}

extension AppDelegate: NSMenuDelegate {
    func menuWillOpen(_ menu: NSMenu) {
        self.updateNumbers()
        
    }
    func menuDidClose(_ menu: NSMenu) {}
    
}

