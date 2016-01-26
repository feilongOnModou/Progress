//
//  BaseBgView.m
//  Progress
//
//  Created by 宋飞龙 on 16/1/26.
//  Copyright © 2016年 Mr Song. All rights reserved.
//

#import "BaseBgView.h"

@implementation BaseBgView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
       
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self buildView];
}

- (void)show {
    [self setNeedsDisplay];
}

- (void)hide {
    
}

- (void)buildView {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width/2;
    self.layer.borderWidth = 2;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

@end
