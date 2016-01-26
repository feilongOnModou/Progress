//
//  BaseWaveView.m
//  Projress
//
//  Created by 宋飞龙 on 16/1/26.
//  Copyright © 2016年 Mr Song. All rights reserved.
//

#import "BaseWaveView.h"
#import "WaveView.h"

@interface BaseWaveView ()

@property (nonatomic , strong) WaveView * waveView;

@end

@implementation BaseWaveView



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self buildView];
}


- (void)show {
    //[self.waveView show];
}

- (void)hide {
    
}

- (void)buildView {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width/2;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    WaveView * view1 = [[WaveView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    view1.wavePercent = self.wavePercent;
    view1.alpha = 0.5;
    [self addSubview:view1];
    
    WaveView * view2 = [[WaveView alloc] initWithFrame:CGRectMake(-300, 0, self.frame.size.width+600, self.frame.size.height)];
    view2.wavePercent = self.wavePercent;
    [self addSubview:view2];
    
    
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
