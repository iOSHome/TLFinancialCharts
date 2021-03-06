//
//  FCPizzaChartViewController.m
//  TLFinancialCharts
//
//  Created by lichuanjun on 2017/10/19.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "FCPizzaChartViewController.h"
#import "CCSTitleValueColor.h"

@interface FCPizzaChartViewController () {
    CCSPizzaChart *_pizzaChart;
}

@end

@implementation FCPizzaChartViewController
@synthesize pizzaChart = _pizzaChart;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Pizza Chart";
}

- (void)randomChangeIndex {
    NSUInteger index = arc4random() % 7;
    [self.pizzaChart selectPartByIndex:index];
    
    [self performSelector:@selector(randomChangeIndex) withObject:nil afterDelay:2.0f];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    CCSPizzaChart *pizzachart = [[CCSPizzaChart alloc] init];
    
    pizzachart.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    NSMutableArray *piedata = [[NSMutableArray alloc] init];
    [piedata addObject:[[CCSTitleValueColor alloc] initWithTitle:@"Alpha" value:1.0 color:[UIColor redColor]]];
    [piedata addObject:[[CCSTitleValueColor alloc] initWithTitle:@"Bravo" value:2.0 color:[UIColor orangeColor]]];
    [piedata addObject:[[CCSTitleValueColor alloc] initWithTitle:@"Charlie" value:3.0 color:[UIColor yellowColor]]];
    [piedata addObject:[[CCSTitleValueColor alloc] initWithTitle:@"Delta" value:4.0 color:[UIColor greenColor]]];
    [piedata addObject:[[CCSTitleValueColor alloc] initWithTitle:@"Echo" value:5.0 color:[UIColor cyanColor]]];
    [piedata addObject:[[CCSTitleValueColor alloc] initWithTitle:@"Foxtrot" value:6.0 color:[UIColor blueColor]]];
    [piedata addObject:[[CCSTitleValueColor alloc] initWithTitle:@"Golf" value:7.0 color:[UIColor purpleColor]]];
    
    pizzachart.data = piedata;
    pizzachart.backgroundColor = [UIColor clearColor];
    
    //select index
    pizzachart.selectedIndex = 2;
    
    //radius
    pizzachart.radius = 100;
    pizzachart.offsetLength = 8;
    
    [self.view addSubview:pizzachart];
    @weakify(self);
    [pizzachart mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.center.equalTo(self.view);
        make.width.height.equalTo(@(self.view.frame.size.width-2));
    }];
    
    self.pizzaChart = pizzachart;
    [self performSelector:@selector(randomChangeIndex) withObject:nil afterDelay:2.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
