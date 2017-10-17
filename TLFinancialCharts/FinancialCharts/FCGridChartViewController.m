//
//  FCGridChartViewController.m
//  TLFinancialCharts
//
//  Created by lichuanjun on 2017/10/17.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "FCGridChartViewController.h"
#import "CCSGridChart.h"

@interface FCGridChartViewController ()

@end

@implementation FCGridChartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
    
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Grid Chart";
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CCSGridChart *gridchart = [[CCSGridChart alloc] init];//[[CCSGridChart alloc] initWithFrame:CGRectMake(0, MARGIN_TOP, 360, 320)];
    
    gridchart.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    gridchart.backgroundColor = [UIColor clearColor];
    
    NSMutableArray *TitleX = [[NSMutableArray alloc] init];
    
    [TitleX addObject:@"11/26"];
    [TitleX addObject:@"12/3"];
    [TitleX addObject:@"12/10"];
    [TitleX addObject:@"12/17"];
    [TitleX addObject:@"12/24"];
    [TitleX addObject:@"12/31"];
    [TitleX addObject:@"1/7"];
    [TitleX addObject:@"1/14"];
    
    gridchart.longitudeTitles = TitleX;
    
    NSMutableArray *TitleY = [[NSMutableArray alloc] init];
    
    [TitleY addObject:@"0"];
    [TitleY addObject:@"1000"];
    [TitleY addObject:@"2000"];
    [TitleY addObject:@"3000"];
    [TitleY addObject:@"4000"];
    
    gridchart.latitudeTitles = TitleY;
    
    [self.view addSubview:gridchart];
    @weakify(self);
    [gridchart mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.center.equalTo(self.view);
        make.width.height.equalTo(@(300));
    }];
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
