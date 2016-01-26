//
//  ViewController.m
//  Progress
//
//  Created by 宋飞龙 on 16/1/26.
//  Copyright © 2016年 Mr Song. All rights reserved.
//

#import "ViewController.h"
#import "BaseProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BaseProgressView * baseView = [[BaseProgressView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    baseView.percent = 0.5;
    baseView.wavePercent = 0.3;
    [baseView show];
    [self.view addSubview:baseView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
