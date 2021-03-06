//
//  FCMinusStickChartViewController.m
//  TLFinancialCharts
//
//  Created by lichuanjun on 2017/10/20.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "FCMinusStickChartViewController.h"
#import "CCSStickChartData.h"
#import "CCSMinusStickChart.h"

@interface FCMinusStickChartViewController ()

@end

@implementation FCMinusStickChartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Minus Stick Chart";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    NSMutableArray *stickData = [[NSMutableArray alloc] init];
    
    [stickData addObject:[[CCSStickChartData alloc] initWithHigh:1301 low:0 date:@"11/26"]];
    [stickData addObject:[[CCSStickChartData alloc] initWithHigh:1269 low:0 date:@"12/3"]];
    [stickData addObject:[[CCSStickChartData alloc] initWithHigh:1383 low:0 date:@"12/10"]];
    [stickData addObject:[[CCSStickChartData alloc] initWithHigh:1315 low:0 date:@"12/17"]];
    [stickData addObject:[[CCSStickChartData alloc] initWithHigh:-1174 low:0 date:@"12/24"]];
    [stickData addObject:[[CCSStickChartData alloc] initWithHigh:-1227 low:0 date:@"12/31"]];
    [stickData addObject:[[CCSStickChartData alloc] initWithHigh:-1308 low:0 date:@"1/7"]];
    [stickData addObject:[[CCSStickChartData alloc] initWithHigh:1468 low:0 date:@"1/14"]];
    
    CCSMinusStickChart *stickchart = [[CCSMinusStickChart alloc] init];
    
    stickchart.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    //设置stickData
    stickchart.stickData = stickData;
    stickchart.maxValue = 1500;
    stickchart.minValue = -1500;
    stickchart.maxSticksNum = 8;
    stickchart.displayCrossXOnTouch = NO;
    stickchart.displayCrossYOnTouch = NO;
    stickchart.latitudeNum = 4;
    stickchart.longitudeNum = 3;
    stickchart.stickFillColor = [UIColor orangeColor];
    stickchart.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:stickchart];
    @weakify(self);
    [stickchart mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.center.equalTo(self.view);
        make.width.height.equalTo(@(self.view.frame.size.width-2));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
