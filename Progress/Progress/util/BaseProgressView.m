//
//  BaseProgressView.m
//  Progress
//
//  Created by 宋飞龙 on 16/1/26.
//  Copyright © 2016年 Mr Song. All rights reserved.
//

#import "BaseProgressView.h"
#import "BaseBgView.h"
#import "BaseCircleView.h"
#import "ChildrenCircleView.h"
#import "BaseWaveView.h"
#import "CenterBgView.h"

@interface BaseProgressView ()

@property (nonatomic , strong) BaseBgView * bgView;
@property (nonatomic , strong) BaseCircleView * baseCircleView;
@property (nonatomic , strong) BaseWaveView * waveView;
@property (nonatomic , strong) CenterBgView * centerBgView;

@property (nonatomic , assign) CGRect subFrame;

@end

@implementation BaseProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.subFrame = frame;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
     [self buildView];
 }
 

- (void)show {
    [self.bgView show];
    [self.baseCircleView show];
    [self.waveView show];
}

- (void)hide {
    [self.bgView hide];
    [self.baseCircleView hide];
    [self.waveView hide];
}

- (void)buildView {
    //圆环背景加环形
    self.bgView = [[BaseBgView alloc] initWithFrame:CGRectMake(0,
                                                               0,
                                                               self.subFrame.size.width,
                                                               self.subFrame.size.height)];
    [self addSubview:self.bgView];
    
    //黄色进度
    self.baseCircleView = [[BaseCircleView alloc] initWithFrame:CGRectMake(0,
                                                                       0,
                                                                       self.subFrame.size.width,
                                                                       self.subFrame.size.height)];
    self.baseCircleView.percent = self.percent;
    [self addSubview:self.baseCircleView];
    
    
    self.centerBgView = [[CenterBgView alloc] initWithFrame:CGRectMake(2,
                                                                   2,
                                                                   self.subFrame.size.width-4,
                                                                       self.subFrame.size.height-4)];
    [self addSubview:self.centerBgView];
    
    self.waveView = [[BaseWaveView alloc] initWithFrame:CGRectMake(7,
                                                                   7,
                                                                   self.subFrame.size.width-14,
                                                                   self.subFrame.size.height-14)];
    self.waveView.wavePercent = self.wavePercent;
    
    [self addSubview:self.waveView];
}

@synthesize percent = _percent;
-(void)setPercent:(CGFloat)percent {
    _percent = percent;
    self.baseCircleView.percent = percent;
}

-(CGFloat)percent {
    return _percent;
}

@synthesize wavePercent = _wavePercent;
-(void)setWavePercent:(CGFloat)wavePercent {
    _wavePercent = wavePercent;
    self.waveView.wavePercent = wavePercent;
}

-(CGFloat)wavePercent {
    return _wavePercent;
}

@end
