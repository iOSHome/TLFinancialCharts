//
//  ViewController.m
//  TLFinancialCharts
//
//  Created by lichuanjun on 2017/10/17.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "FCRootViewController.h"
#import "FCAppDelegate.h"

@interface FCRootViewController ()
    
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;
    
@end

@implementation FCRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;

    [self addCell:@"Grid Chart" class:@"FCGridChartViewController"];//网格图
    [self addCell:@"Line Chart" class:@"FCLineChartViewController"];//线形图(包含单线图和多线图)
    [self addCell:@"Stick Chart" class:@"FCStickChartViewController"];//柱形图(包含分段面积图)
    [self addCell:@"MAStick Chart" class:@"FCMAStickChartViewController"];//均线柱形图
    [self addCell:@"Candle Stick Chart" class:@"FCCandleStickViewController"];//K线或蜡烛线图
    [self addCell:@"MACandle Stick Chart" class:@"FCMACandleStickChartViewController"];//均线蜡烛台表
    [self addCell:@"Pie Chart" class:@"FCPieChartViewController"];//基本饼图
    [self addCell:@"Pizza Chart" class:@"FCPizzaChartViewController"];//分割饼图
    [self addCell:@"Spider Web Chart" class:@"FCSpiderWebChartViewController"];//蛛网图
    [self addCell:@"Minus Stick Chart" class:@"FCMinusStickChartViewController"];//分时图
    [self addCell:@"MACD Chart" class:@"FCMACDChartViewController"];//平均线指标图
    [self addCell:@"Area Chart" class:@"FCAreaChartViewController"];//面积图(包含单线面积图和多线面积图)
    [self addCell:@"Stacked Area Chart" class:@"FCStackedAreaChartViewController"];//堆叠面积图
    [self addCell:@"Band Area Chart" class:@"FCBandAreaChartViewController"];//带面积图
    [self addCell:@"Radar Chart" class:@"FCRadarChartViewController"];//雷达图
    [self addCell:@"Slip Stick Chart" class:@"FCSlipStickChartController"];//滑棒图
    [self addCell:@"Colored Stick Chart" class:@"FCColoredStickChartViewController"];//彩色滑棒图
    [self addCell:@"Slip Candle Stick Chart" class:@"FCSlipCandleStickChartViewController"];//滑蜡烛台表
    [self addCell:@"MA Slip Candle Stick Chart" class:@"FCMASlipCandleStickChartViewController"];//均线滑蜡烛台表
    [self addCell:@"BOLL MA Slip Candle Stick Chart" class:@"FCBOLLMASlipCandleStickChartViewController"];//BOLL均线滑蜡烛台表
    [self addCell:@"Slip Line Chart" class:@"FCSlipLineChartViewController"];//滑线图表
    [self addCell:@"Donut Chart" class:@"FCDonutChartViewController"];//甜甜圈图
    
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Cocoa-Charts v0.0.1";
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addCell:(NSString *)title class:(NSString *)className {
    [self.titles addObject:title];
    [self.classNames addObject:className];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _titles.count;
    }
    
    return 0;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"fccellidentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = _titles[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.classNames[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = _titles[indexPath.row];
        
        FCAppDelegate *appDelegate = (FCAppDelegate *) [UIApplication sharedApplication].delegate;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            UINavigationController *navigationController = (UINavigationController *) appDelegate.viewController;
            [navigationController pushViewController:ctrl animated:YES];
        } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            UISplitViewController *splitViewController = (UISplitViewController *) appDelegate.viewController;
            UINavigationController *navigationController = [splitViewController.viewControllers objectAtIndex:1];
            [navigationController popToRootViewControllerAnimated:NO];
            [navigationController pushViewController:ctrl animated:YES];
        }
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
    
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UILabel *lblTitle = [[UILabel alloc] init];
        lblTitle.backgroundColor = [UIColor grayColor];
        lblTitle.textColor = [UIColor whiteColor];
        lblTitle.text = @"Single Chart Demo";
        return lblTitle;
    } else {
        return nil;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 22.0f;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0f;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

@end
