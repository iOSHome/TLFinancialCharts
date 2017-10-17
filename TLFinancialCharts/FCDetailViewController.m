//
//  FCDetailViewController.m
//  TLFinancialCharts
//
//  Created by lichuanjun on 2017/10/17.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "FCDetailViewController.h"

@interface FCDetailViewController ()

@end

@implementation FCDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Cocoa-Charts Demo App";
}

@end
