ScrollableDatepicker
============

<p align="left">
	<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/Swift_3-compatible-4BC51D.svg?style=flat" alt="Swift 3 compatible" /></a>
	<a href="https://cocoapods.org/pods/ScrollableDatepicker"><img src="https://img.shields.io/badge/pod-2.0.1-blue.svg" alt="CocoaPods compatible" /></a>
	<img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
	<a href="https://raw.githubusercontent.com/maxsokolov/tablekit/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>

![demo](Screenshots/screen.png)


## Installation

### CocoaPods

Add the following line to your Podfile:

```ruby
pod 'ScrollableDatepicker', '~> 2.0'
```

Then run the following in the same directory as your Podfile:
```ruby
pod install
```

### Manual

Copy the folder `Sources/` to your project.


## Configuration

### Day Style Configuration


You can customize following properties for each state (default, weekend, selected):

- Font & Color for day, week day and month
- Background Color for cell
- Selector Color

Depending on the state of the cell, its style is composed of the default and appropriate styles.


### Data Configuration

- Number of dates in one screen


### Example 

![demo](Screenshots/screen-customization.png)

```swift
var configuration = Configuration()

// weekend customization
configuration.weekendDayStyle.dateTextColor = UIColor(red: 242.0/255.0, green: 93.0/255.0, blue: 28.0/255.0, alpha: 1.0)
configuration.weekendDayStyle.dateTextFont = UIFont.boldSystemFont(ofSize: 20)
configuration.weekendDayStyle.weekDayTextColor = UIColor(red: 242.0/255.0, green: 93.0/255.0, blue: 28.0/255.0, alpha: 1.0)

// selected date customization
configuration.selectedDayStyle.backgroundColor = UIColor(white: 0.9, alpha: 1)

datepicker.configuration = configuration

```
