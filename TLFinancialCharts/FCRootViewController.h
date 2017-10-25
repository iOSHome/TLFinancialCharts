//
//  ViewController.h
//  TLFinancialCharts
//
//  Created by lichuanjun on 2017/10/17.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    FCChartTypeGridChart = 0,//网格图
    FCChartTypeLineChart = 1,//线形图(包含单线图和多线图)
    FCChartTypeStickChart = 2,//柱形图(包含分段面积图)
    FCChartTypeMAStickChart = 3,//MACD等证券相关图表(MACD Stick chart etc.)
    FCChartTypeCandleStickChart = 4,//K线或蜡烛线图
    FCChartTypeMACandleStickChart = 5,//均线蜡烛台表
    FCChartTypePieChart = 6,//基本饼图
    FCChartTypePizzaChart = 7,//分割饼图
    FCChartTypeSpiderWebChart = 8,//蛛网图
    FCChartTypeMinusStickChart = 9,//分时图
    FCChartTypeMACDChart = 10,//平均线指标图
    FCChartTypeAreaChart = 11,//面积图(包含单线面积图和多线面积图)
    FCChartTypeStackedAreaChart = 12,//堆叠面积图
    FCChartTypeBandAreaChart = 13,//带面积图
    FCChartTypeRadarChart = 14,//雷达图
    FCChartTypeSlipStickChart = 15,//滑棒图
    FCChartTypeColoredSlipStickChart = 16,//彩色滑棒图
    FCChartTypeSlipCandleStickChart = 17,//滑蜡烛台表
    FCChartTypeMASlipCandleStickChart = 18,//均线滑蜡烛台表
    FCChartTypeBOLLMASlipCandleStickChart = 19,//BOLL均线滑蜡烛台表
    FCChartTypeSlipLineChart = 20,//滑线图表
    FCChartTypeDonutChart = 21,//甜甜圈图
} FCChartType;

@interface FCRootViewController : UITableViewController


@end

