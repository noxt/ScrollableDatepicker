//
//  Created by Dmitry Ivanenko on 01.10.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


public protocol ScrollableDatepickerDelegate: class {
    func datepicker(_ datepicker: ScrollableDatepicker, didSelectDate date: Date)
}


open class ScrollableDatepicker: LoadableFromXibView {

    @IBOutlet public weak var collectionView: UICollectionView! {
        didSet {
            let podBundle = Bundle(for: ScrollableDatepicker.self)
            let bundlePath = podBundle.path(forResource: String(describing: type(of: self)), ofType: "bundle")
            var bundle: Bundle? = nil

            if bundlePath != nil {
                bundle = Bundle(path: bundlePath!)
            }

            let cellNib = UINib(nibName: DayCell.ClassName, bundle: bundle)
            collectionView.register(cellNib, forCellWithReuseIdentifier: DayCell.ClassName)
        }
    }


    // MARK: Configuration properties

    public weak var delegate: ScrollableDatepickerDelegate?
    public var cellConfiguration: ((_ cell: DayCell, _ isWeekend: Bool, _ isSelected: Bool) -> Void)? {
        didSet {
            collectionView.reloadData()
        }
    }
    public var dates = [Date]() {
        didSet {
            collectionView.reloadData()
        }
    }
    public var selectedDate: Date? {
        didSet {
            collectionView.reloadData()
        }
    }
    public var configuration = Configuration() {
        didSet {
            collectionView.reloadData()
        }
    }


    // MARK: Methods

    public func scrollToSelectedDate(animated: Bool) {
        guard let selectedDate = self.selectedDate else {
            return
        }

        guard let index = dates.index(where: { Int($0.timeIntervalSince1970) == Int(selectedDate.timeIntervalSince1970) }) else {
            return
        }

        collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: animated)
        collectionView.reloadData()
    }

    open override func layoutSubviews() {
        super.layoutSubviews()

        collectionView.reloadData()
        DispatchQueue.main.async {
            self.scrollToSelectedDate(animated: false)
        }
    }

}


// MARK: - UICollectionViewDataSource

extension ScrollableDatepicker: UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCell.ClassName, for: indexPath) as! DayCell

        let date = dates[indexPath.row]
        let isWeekendDate = isWeekday(date: date)
        let isSelectedDate = isSelected(date: date)

        cell.setup(date: date, style: configuration.calculateDayStyle(isWeekend: isWeekendDate, isSelected: isSelectedDate))

        if let configuration = cellConfiguration {
            configuration(cell, isWeekendDate, isSelectedDate)
        }

        return cell
    }

    private func isWeekday(date: Date) -> Bool {
        let day = NSCalendar.current.component(.weekday, from: date)
        return day == 1 || day == 7
    }

    private func isSelected(date: Date) -> Bool {
        guard let selectedDate = selectedDate else {
            return false
        }
        return Int(date.timeIntervalSince1970) == Int(selectedDate.timeIntervalSince1970)
    }

}


// MARK: - UICollectionViewDelegate

extension ScrollableDatepicker: UICollectionViewDelegate {

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        let date = dates[indexPath.row]
        selectedDate = date
        delegate?.datepicker(self, didSelectDate: date)
        scrollToSelectedDate(animated: true)
    }

}


// MARK: - UICollectionViewDelegateFlowLayout

extension ScrollableDatepicker: UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var screenOrientation: UIInterfaceOrientation {
            return UIApplication.shared.statusBarOrientation
        }
        
        let cellWidth = UIInterfaceOrientationIsPortrait(screenOrientation) ? UIScreen.main.bounds.width : UIScreen.main.bounds.height
        
        return CGSize(width: cellWidth / CGFloat(configuration.numberOfDatesInOneScreen), height: collectionView.frame.height)
    }
    
}
