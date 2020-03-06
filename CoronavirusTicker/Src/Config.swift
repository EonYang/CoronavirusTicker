//
//  Config.swift
//  Cov_in_Status_Bar
//
//  Created by yangyang on 3/4/20.
//  Copyright © 2020 yangyang. All rights reserved.
//

import Cocoa

class Config {
    
    static let urlConfirmed = URL(string: "https://raw.githubusercontent.com/EonYang/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv")
    
    static let urlDead = URL(string: "https://raw.githubusercontent.com/EonYang/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv")
    
    static let urlRecovered = URL(string: "https://raw.githubusercontent.com/EonYang/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Recovered.csv")
    
    static var regions:[String]! = ["World"]
    static let China:[String]! = ["Mainland China","Taiwan","Hong Kong","Macau"]
    static let updateIntervalPossibleValues:[String]! = ["1 minute", "10 minutes", "1 hour", "2 hours","4 hours", "8 hours", "1 day"]
    static var updateInterval:Int! = 10
    // statusBarIconMode, values:
    static let statusBarIconModePossibleValues:[String]! = ["Both", "Icon Only", "Number Only"]
    static var statusBarIconMode:String! = "Both"
    
    static func initUserDefaults (){
        
        if UserDefaults.standard.string(forKey: "StatusBarIconMode") == nil {
            UserDefaults.standard.set("Both" ,forKey: "StatusBarIconMode")
        }else if let userIconMode = UserDefaults.standard.string(forKey: "StatusBarIconMode") {
            print(userIconMode)
            self.statusBarIconMode = userIconMode
        }
        
        if UserDefaults.standard.string(forKey: "RegionPreferenceString") == nil {
            UserDefaults.standard.set("World" ,forKey: "RegionPreferenceString")
        } else if let userRegion = UserDefaults.standard.string(forKey: "RegionPreferenceString"){
            print(userRegion)
            self.setSelectedRegion(userRegion)
        }
        
        if UserDefaults.standard.string(forKey: "UpdateInterval") == nil {
            UserDefaults.standard.set("1 hour" ,forKey: "UpdateInterval")
        } else if let interval = UserDefaults.standard.string(forKey: "UpdateInterval"){
            print(interval)
            self.setUpdateInterval(interval)
        }
        
    }
    
    
    
    static func setUpdateInterval (_ interval:String!){
        guard interval != nil else {
            return
        }
        UserDefaults.standard.set(interval, forKey: "UpdateInterval")
        switch interval {
        case "1 minute":
            self.updateInterval = 60
        case "10 minutes":
            self.updateInterval = 600
        case "1 hour":
            self.updateInterval = 3600
        case "2 hours":
            self.updateInterval = 7200
        case "4 hours":
            self.updateInterval = 14400
        case "8 hours":
            self.updateInterval = 28800
        case "1 day":
            self.updateInterval = 86400
        default:
            print("invalid interval")
        }
    }
    
    static func setIconMode (_ mode:String!){
        guard mode != nil else {
            return
        }
        UserDefaults.standard.set(mode, forKey: "StatusBarIconMode")
        self.statusBarIconMode = mode
    }
    
    
    static func setSelectedRegion(_ selected:String?) {
        guard selected != nil else {
            return
        }
        UserDefaults.standard.set(selected, forKey: "RegionPreferenceString")
        if(self.China.contains(selected!)){
            self.regions = self.China
        } else {
            self.regions = [selected!]
        }
    }
    
}
