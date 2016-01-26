//
//  BaseProjressView.m
//  Projress
//
//  Created by 宋飞龙 on 16/1/26.
//  Copyright © 2016年 Mr Song. All rights reserved.
//

#import "BaseProjressView.h"
#import "BaseBgVIew.h"
#import "BaseCircleView.h"
#import "ChildrenCircleView.h"
#import "BaseWaveView.h"

@interface BaseProjressView ()

@property (nonatomic , strong) BaseBgVIew * bgView;
@property (nonatomic , strong) BaseCircleView * circleView;
@property (nonatomic , strong) ChildrenCircleView * childrenCircleView;
@property (nonatomic , strong) BaseWaveView * waveView;

@property (nonatomic , assign) CGRect subFrame;

@end

@implementation BaseProjressView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.subFrame = frame;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)show {
    [self.bgView show];
    [self.circleView show];
    [self.childrenCircleView show];
    [self.waveView show];
}

- (void)hide {
    [self.bgView hide];
    [self.circleView hide];
    [self.childrenCircleView hide];
    [self.waveView hide];
}

- (void)buildView {
    self.circleView = [[BaseCircleView alloc] initWithFrame:CGRectMake(0,
                                                                       0,
                                                self.subFrame.size.width,
                                               self.subFrame.size.height)];
    [self addSubview:self.circleView];
    self.childrenCircleView = [[ChildrenCircleView alloc] initWithFrame:CGRectMake(0,
                                                                                   0,
                                                            self.subFrame.size.width,
                                                            self.subFrame.size.height)];
    [self.circleView addSubview:self.childrenCircleView];
    self.bgView = [[BaseBgVIew alloc] initWithFrame:CGRectMake(0,
                                                               0,
                                        self.subFrame.size.width,
                                        self.subFrame.size.height)];
    [self addSubview:self.bgView];
    self.waveView = [[BaseWaveView alloc] initWithFrame:CGRectMake(0,
                                                                   0,
                                            self.subFrame.size.width,
                                            self.subFrame.size.height)];
    [self.bgView addSubview:self.waveView];
}

@synthesize percent = _percent;
-(void)setPercent:(CGFloat)percent {
    _percent = percent;
    self.childrenCircleView.percent = percent;
}

-(CGFloat)percent {
    return _percent;
}

@end
