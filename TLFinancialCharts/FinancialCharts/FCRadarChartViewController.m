//
//  FCRadarChartViewController.m
//  TLFinancialCharts
//
//  Created by lichuanjun on 2017/10/20.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "FCRadarChartViewController.h"
#import "CCSRadarChart.h"
#import "CCSTitleValuesColor.h"

@interface FCRadarChartViewController ()

@end

@implementation FCRadarChartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Radar Chart";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    CCSRadarChart *spiderwebchart = [[CCSRadarChart alloc] init];
    
    spiderwebchart.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    NSArray *values1 = [NSArray arrayWithObjects:
                        [NSNumber numberWithFloat:3.0f],
                        [NSNumber numberWithFloat:4.0f],
                        [NSNumber numberWithFloat:3.0f],
                        [NSNumber numberWithFloat:4.0f],
                        [NSNumber numberWithFloat:5.0f],
                        nil];
    NSArray *values2 = [NSArray arrayWithObjects:
                        [NSNumber numberWithFloat:5.0f],
                        [NSNumber numberWithFloat:2.0f],
                        [NSNumber numberWithFloat:3.0f],
                        [NSNumber numberWithFloat:2.0f],
                        [NSNumber numberWithFloat:3.0f],
                        nil];
    
    NSMutableArray *spiderwebdata = [[NSMutableArray alloc] init];
    [spiderwebdata addObject:[[CCSTitleValuesColor alloc] initWithTitle:@"New York" values:values1 color:[UIColor blueColor]]];
    [spiderwebdata addObject:[[CCSTitleValuesColor alloc] initWithTitle:@"Los Angeles" values:values2 color:[UIColor redColor]]];
    
    spiderwebchart.titles = [NSMutableArray arrayWithObjects:@"Alpha", @"Bravo", @"Charlie", @"Delta", @"Echo", nil];
    
    spiderwebchart.data = spiderwebdata;
    
    spiderwebchart.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:spiderwebchart];
    @weakify(self);
    [spiderwebchart mas_makeConstraints:^(MASConstraintMaker *make) {
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
