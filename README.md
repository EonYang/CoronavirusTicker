# Coronavirus-in-status-bar

## This project is a personal practicing of creating an agent app on Mac OS.

Congifurations are hard-coded. Currently it only displays statistical data of China, since I'm a Chinese.

If you wanna use this app, you'll need to:

Edit `AppDelegate.swift`:

```
    let global:Bool = false
    let regions = ["China","Taiwan","Hong Kong","Macau"]
    let refreshEvery:Int = 60
```
Set `global` to `true` if you care about the world.

Set `global` to `false` and put countries that you care about in `regions`. 

Check the country names from [this repo](https://github.com/CSSEGISandData/COVID-19/blob/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv), from where I fetch data.

## Denpendencies

This project uses [Cocoapods](https://cocoapods.org/) to manage dependencies.

In your shell, navigate to the directory where `Podfile` lives, then type the follow command to install dependencies.

```
pod install
```

## Happy hacking!
Feel free to do anything to this project.





# CoronavirusTicker
# CoronavirusTicker
# CoronavirusTicker
