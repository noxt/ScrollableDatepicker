//
//  Created by Dmitry Ivanenko on 19.06.17.
//  Copyright © 2017 Dmitry Ivanenko. All rights reserved.
//

import UIKit


public struct Configuration {

    public enum DaySizeCalculationStrategy {
        case constantWidth(CGFloat)
        case numberOfVisibleItems(Int)
    }

    public var daySizeCalculation: DaySizeCalculationStrategy = DaySizeCalculationStrategy.numberOfVisibleItems(5)


    // MARK: - Styles

    public var defaultDayStyle: DayStyleConfiguration = {
        var configuration = DayStyleConfiguration()

        configuration.dateTextFont = .systemFont(ofSize: 20, weight: UIFont.Weight.thin)
        configuration.dateTextColor = .black

        configuration.weekDayTextFont = .systemFont(ofSize: 8, weight: UIFont.Weight.thin)
        configuration.weekDayTextColor = .black

        configuration.monthTextFont = .systemFont(ofSize: 8, weight: UIFont.Weight.light)
        configuration.monthTextColor = .gray

        configuration.selectorColor = .clear
        configuration.backgroundColor = .white

        return configuration
    }()

    public var weekendDayStyle: DayStyleConfiguration = {
        var configuration = DayStyleConfiguration()
        configuration.weekDayTextFont = .systemFont(ofSize: 8, weight: UIFont.Weight.bold)
        return configuration
    }()

    public var selectedDayStyle: DayStyleConfiguration = {
        var configuration = DayStyleConfiguration()
        configuration.selectorColor = UIColor(red: 242.0/255.0, green: 93.0/255.0, blue: 28.0/255.0, alpha: 1.0)
        return configuration
    }()


    // MARK: - Configuration
    @available(*, deprecated, message: "Use daySizeCalculation property")
    public var numberOfDatesInOneScreen: Int = 5 {
        didSet {
            daySizeCalculation = .numberOfVisibleItems(numberOfDatesInOneScreen)
        }
    }
    

    // MARK: - Initializer
    public init() {
    }


    // MARK: - Methods

    func calculateDayStyle(isWeekend: Bool, isSelected: Bool) -> DayStyleConfiguration {
        var style = defaultDayStyle

        if isWeekend {
            style = style.merge(with: weekendDayStyle)
        }

        if isSelected {
            style = style.merge(with: selectedDayStyle)
        }

        return style
    }

}


public struct DayStyleConfiguration {

    public var dateTextFont: UIFont?
    public var dateTextColor: UIColor?

    public var weekDayTextFont: UIFont?
    public var weekDayTextColor: UIColor?

    public var monthTextFont: UIFont?
    public var monthTextColor: UIColor?

    public var selectorColor: UIColor?
    public var backgroundColor: UIColor?


    // MARK: - Initializer
    public init() {
    }


    public func merge(with style: DayStyleConfiguration) -> DayStyleConfiguration {
        var newStyle = DayStyleConfiguration()

        newStyle.dateTextFont = style.dateTextFont ?? dateTextFont
        newStyle.dateTextColor = style.dateTextColor ?? dateTextColor

        newStyle.weekDayTextFont = style.weekDayTextFont ?? weekDayTextFont
        newStyle.weekDayTextColor = style.weekDayTextColor ?? weekDayTextColor

        newStyle.monthTextFont = style.monthTextFont ?? monthTextFont
        newStyle.monthTextColor = style.monthTextColor ?? monthTextColor

        newStyle.selectorColor = style.selectorColor ?? selectorColor
        newStyle.backgroundColor = style.backgroundColor ?? backgroundColor

        return newStyle
    }

}
