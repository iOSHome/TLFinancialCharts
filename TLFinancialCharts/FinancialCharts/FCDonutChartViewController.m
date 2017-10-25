//
//  FCDonutChartViewController.m
//  TLFinancialCharts
//
//  Created by lichuanjun on 2017/10/20.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "FCDonutChartViewController.h"
#import "CCSDonutChart.h"
#import "CCSTitleValueColor.h"

@interface FCDonutChartViewController ()

@end

@implementation FCDonutChartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Donut Chart";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    CCSDonutChart *donutchart = [[CCSDonutChart alloc] init];
    
    donutchart.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    NSMutableArray *piedata = [[NSMutableArray alloc] init];
    [piedata addObject:[[CCSTitleValueColor alloc] initWithTitle:@"Alpha" value:2.0 color:[UIColor redColor]]];
    [piedata addObject:[[CCSTitleValueColor alloc] initWithTitle:@"Bravo" value:3.0 color:[UIColor orangeColor]]];
    [piedata addObject:[[CCSTitleValueColor alloc] initWithTitle:@"Charlie" value:4.0 color:[UIColor yellowColor]]];
    [piedata addObject:[[CCSTitleValueColor alloc] initWithTitle:@"Delta" value:3.0 color:[UIColor greenColor]]];
    [piedata addObject:[[CCSTitleValueColor alloc] initWithTitle:@"Echo" value:2.0 color:[UIColor cyanColor]]];
    [piedata addObject:[[CCSTitleValueColor alloc] initWithTitle:@"Foxtrot" value:3.0 color:[UIColor blueColor]]];
    [piedata addObject:[[CCSTitleValueColor alloc] initWithTitle:@"Golf" value:4.0 color:[UIColor purpleColor]]];
    
    donutchart.data = piedata;
    donutchart.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:donutchart];
    @weakify(self);
    [donutchart mas_makeConstraints:^(MASConstraintMaker *make) {
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
