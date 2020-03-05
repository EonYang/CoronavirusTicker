//
//  DataManager.swift
//  Cov_in_Status_Bar
//
//  Created by yangyang on 3/4/20.
//  Copyright © 2020 yangyang. All rights reserved.
//

import Cocoa
import SwiftCSV
import SwiftDate

class DataManager: NSObject {
    
    static var backUpDataString:String = ""
    static var lastConfirmed:String! = "Loading"
    
    static var regions:[String]! = ["Afghanistan", "Algeria", "Andorra", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahrain", "Belarus", "Belgium", "Brazil", "Cambodia", "Canada", "Chile", "China", "Croatia", "Czech Republic", "Denmark", "Dominican Republic", "Ecuador", "Egypt", "Estonia", "Finland", "France", "Georgia", "Germany", "Greece", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Japan", "Jordan", "Kuwait", "Latvia", "Lebanon", "Lithuania", "Luxembourg", "Malaysia", "Mexico", "Monaco", "Morocco", "Nepal", "Netherlands", "New Zealand", "Nigeria", "North Macedonia", "Norway", "Oman", "Others", "Pakistan", "Philippines", "Portugal", "Qatar", "Romania", "Russia", "San Marino", "Saudi Arabia", "Senegal", "Singapore", "South Korea", "Spain", "Sri Lanka", "Sweden", "Switzerland", "Thailand", "UK", "US", "Ukraine", "United Arab Emirates", "Vietnam"]
    
    static func getRegions() {
        let task = URLSession.shared.dataTask(with: Config.urlConfirmed!) {(data, response, error) in
            guard let data = data else { return }
            do {
                let csv: CSV = try CSV(string: String(data: data, encoding: .utf8)!)
                if var regions:[String] = csv.namedColumns["Country/Region"] {
                    regions.removeDuplicates()
                    self.regions! = Tools.pc(regions)
                    print("Regions fetched")
                    print(self.regions!)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    static func setLastUpdateDate(_ lastDay:String!,_ menuItem: NSMenuItem!) {
        let now = Date()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            menuItem.title = "Till " + lastDay + ", updated " + now.toRelative(style: RelativeFormatter.defaultStyle(), locale: Locales.english)
        }
    }
    static func setNumber(_ lable:NSTextField!, _ number:Int!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            lable.stringValue = String(number)
        }
    }
    
    static func getSum(url:URL, completionHandeler: @escaping (_ sum: Int?, _ lastDay: String?) -> Void ){
        var r: Int! = 0
        var dataString:String?
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            dataString = String(data: data, encoding: .utf8)!
            do {
                let csv: CSV = try CSV(string: dataString!)
                if let lastDay:String = csv.header.last {
                    for line in csv.namedRows {
                        guard let lineLastDay = Int(line[lastDay]!) else {
                            return
                        }
                        if Config.regions.contains("World") {
                            r += lineLastDay
                        }
                        else if Config.regions.contains(where: line["Country/Region"]!.contains)
                        {
                            r += lineLastDay
                        }
                    }
                    completionHandeler(r!, lastDay)
                }
            } catch {
            }
        }
        task.resume()
        
    }
    

}
