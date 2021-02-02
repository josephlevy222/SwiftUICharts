//
//  LineAndBarProtocols.swift
//  
//
//  Created by Will Dale on 02/02/2021.
//

import SwiftUI

// MARK: - Chart Data
/**
 A protocol to extend functionality of `ChartData` specifically for Line and Bar Charts.
 
 # Reference
 [See ChartData](x-source-tag://ChartData)
 
 - Tag: LineAndBarChartData
 */
public protocol LineAndBarChartData : ChartData {
    
    associatedtype Body    : View
    associatedtype CTStyle : CTLineAndBarChartStyle
    
    /**
     Data model to hold data about the Views layout.

     This informs some `ViewModifiers` whether the chart has X and/or Y axis labels so they can configure thier layouts appropriately.
     */
    var viewData: ChartViewData { get set }
    /**
     Data model conatining the style data for the chart.
     
     # Reference
     [CTChartStyle](x-source-tag://CTChartStyle)
     */
    var chartStyle: CTStyle { get set }
    
    /**
     Array of strings for the labels on the X Axis instead of the labels in the data points.

     To control where the labels should come from. Set [LabelsFrom](x-source-tag://LabelsFrom) in [ChartStyle](x-source-tag://CTChartStyle).
    */
    var xAxisLabels: [String]? { get set }
    
    /**
     Displays a view for the labels on the X Axis.
     
     Labels can come from either [CTChartDataPoint](x-source-tag://CTChartDataPoint) or [ChartData](x-source-tag://ChartData)
     
     - Returns: An `HStack` of `Text` containin x axis labels.
     
     - Tag: getXAxidLabels
     */
    func getXAxidLabels() -> Body
    
    /**
     Labels to display on the Y axis
     
     The labels are generated based on the range between the lowest number in the data set (or 0) and highest number in the data set.
     
     - Returns: Array of evenly spaced numbers.
     
     - Tag: getYLabels
     */
    func getYLabels() -> [Double]
    
    /**
     Returns the difference between the highest and lowest numbers in the data set or data sets.
     - Tag: getRange
     */
    func getRange() -> Double
    
    /**
     Returns the lowest value in the data set or data sets.
     - Tag: getMinValue
     */
    func getMinValue() -> Double
    
    /**
     Returns the highest value in the data set or data sets
     - Tag: getMaxValue
     */
    func getMaxValue() -> Double
    
    /**
     Returns the average value from the data set or data sets.
     - Tag: getAverage
     */
    func getAverage() -> Double
}

extension LineAndBarChartData {
    public func getHeaderLocation() -> InfoBoxPlacement {
        return self.chartStyle.infoBoxPlacement
    }
}
extension LineAndBarChartData where Set: SingleDataSet {
    public func getRange() -> Double {
        DataFunctions.dataSetRange(from: dataSets)
    }
    public func getMinValue() -> Double {
        DataFunctions.dataSetMinValue(from: dataSets)
    }
    public func getMaxValue() -> Double {
        DataFunctions.dataSetMaxValue(from: dataSets)
    }
    public func getAverage() -> Double {
        DataFunctions.dataSetAverage(from: dataSets)
    }
}
extension LineAndBarChartData where Set: MultiDataSet {
    public func getRange() -> Double {
        DataFunctions.multiDataSetRange(from: dataSets)
    }
    public func getMinValue() -> Double {
        DataFunctions.multiDataSetMinValue(from: dataSets)
    }
    public func getMaxValue() -> Double {
        DataFunctions.multiDataSetMaxValue(from: dataSets)
    }
    public func getAverage() -> Double {
        DataFunctions.multiDataSetAverage(from: dataSets)
    }
}

// MARK: - Style
/**
 A protocol to extend functionality of `CTChartStyle` specifically for  Line and Bar Charts.
 
 - Tag: CTLineAndBarChartStyle
 */
public protocol CTLineAndBarChartStyle: CTChartStyle {
    /**
     Style of the vertical lines breaking up the chart
     
     [See GridStyle](x-source-tag://GridStyle)
     */
    var xAxisGridStyle: GridStyle { get set }
    
    /**
     Style of the horizontal lines breaking up the chart.
     
     [See GridStyle](x-source-tag://GridStyle)
     */
    var yAxisGridStyle: GridStyle { get set }
    
    /**
     Location of the X axis labels - Top or Bottom
     
     [See XAxisLabelPosistion](x-source-tag://XAxisLabelPosistion)
     */
    var xAxisLabelPosition: XAxisLabelPosistion { get set }
    
    /**
     Where the label data come from. DataPoint or ChartData
     
     [See LabelsFrom](x-source-tag://LabelsFrom)
     */
    var xAxisLabelsFrom: LabelsFrom { get set }
    
    /**
     Location of the X axis labels - Leading or Trailing
     
     [See YAxisLabelPosistion](x-source-tag://YAxisLabelPosistion)
     */
    var yAxisLabelPosition: YAxisLabelPosistion { get set }
    
    /**
     Number Of Labels on Y Axis
     */
    var yAxisNumberOfLabels: Int { get set }
}

// MARK: DataPoints
/**
 A protocol to extend functionality of `CTChartDataPoint` specifically for Line and Bar Charts.
  
 - Tag: CTLineAndBarDataPoint
 */
public protocol CTLineAndBarDataPoint: CTChartDataPoint {
    
    /// Data points label for the X axis.
    var xAxisLabel       : String? { get set }
}


